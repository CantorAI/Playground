import pyarrow as pa
import pyarrow.ipc as ipc
import numpy as np
import time
import sys
import mmap
import os

# Constants
SHM_NAME = "shared_memory"
SIGNAL_FILE = "data_ready.signal"
LENGTH = 1024 * 1024 * 1024  # 1 GB data
SLICE_LENGTH = 1024 * 1024*32  # 1 MB slices

# Server functions
def prepare_data(length, slice_length, shm_name, signal_file):
    # Generate random byte data
    data = np.random.bytes(length)
    
    # Write to shared memory
    with open(shm_name, 'wb') as f:
        f.write(data)

    # Resize file to match buffer size
    os.truncate(shm_name, length)

    # Create a signal file to indicate data is ready
    with open(signal_file, 'w') as f:
        f.write('ready')

    print(f"Data prepared with length {length} and slice length {slice_length}")

def get_data(shm_name, current_position, slice_len, data_len):
    # Read from shared memory
    with open(shm_name, 'rb') as f:
        shm = mmap.mmap(f.fileno(), 0, access=mmap.ACCESS_READ)
        shm.seek(current_position)
        end_position = current_position + slice_len
        if end_position > data_len:
            end_position = data_len
        slice_data = shm.read(end_position - current_position)
        shm.close()

    return slice_data, end_position

def main():
    if len(sys.argv) > 1:
        mode = sys.argv[1]
    else:
        mode = 'server'  # Default mode

    if mode == 'server':
        print("Starting as server...")
        prepare_data(LENGTH, SLICE_LENGTH, SHM_NAME, SIGNAL_FILE)

        # Keep the server running to serve data
        while True:
            time.sleep(1)

    elif mode == 'client':
        print("Starting as client...")

        # Wait for the signal file to be created by the server
        while not os.path.exists(SIGNAL_FILE):
            time.sleep(0.1)

        start_time = time.time()

        current_position = 0
        while current_position < LENGTH:
            slice_data, current_position = get_data(SHM_NAME, current_position, SLICE_LENGTH, LENGTH)
            # Process the slice_data if needed (e.g., summing the data)
            # For benchmarking, we'll just continue to fetch the data

        end_time = time.time()
        elapsed_time = end_time - start_time

        print(f"Time taken to fetch and process the large data: {elapsed_time:.2f} seconds")

        # Clean up signal file
        os.remove(SIGNAL_FILE)

    else:
        print(f"Unknown mode: {mode}")

if __name__ == "__main__":
    main()
