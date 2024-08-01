import multiprocessing as mp
import time
import sys

# Define global variables for the server process
data = None
data_len = 0
slice_len = 0
current_position = 0

# Server functions
def PrepareData(length, slice_length):
    global data, data_len, slice_len, current_position
    data_len = length
    slice_len = slice_length
    data = bytearray(range(48, 122)) * (data_len // (122 - 48))
    current_position = 0
    print(f"Data prepared with length {data_len} and slice length {slice_len}")

def GetData():
    global current_position
    if current_position >= data_len:
        return None
    end_position = current_position + slice_len
    if end_position > data_len:
        end_position = data_len
    slice_data = data[current_position:end_position]
    current_position = end_position
    return slice_data

def close():
    global data, data_len, slice_len, current_position
    data = None
    data_len = 0
    slice_len = 0
    current_position = 0
    print("Data closed and resources released")

def server(queue):
    PrepareData(1024 * 1024 * 1024, 1024 * 1024)  # Prepare 10 MB data with 1 MB slices
    while True:
        message = queue.get()
        if message == 'get_data':
            slice_data = GetData()
            queue.put(slice_data)
        elif message == 'close':
            close()
            break

def client(queue):
    start_time = time.time()

    while True:
        queue.put('get_data')
        slice_data = queue.get()
        if slice_data is None:
            break
        # Process the slice_data if needed (e.g., summing the data)
        # For benchmarking, we'll just continue to fetch the data

    end_time = time.time()
    elapsed_time = end_time - start_time

    queue.put('close')
    print(f"Time taken to fetch and process the large data: {elapsed_time:.2f} seconds")

def main():
    if len(sys.argv) > 1:
        mode = sys.argv[1]
    else:
        mode = 'client'  # Default mode

    queue = mp.Queue()

    if mode == 'server':
        print("Starting as server...")
        server_process = mp.Process(target=server, args=(queue,))
        server_process.start()
        server_process.join()

    elif mode == 'client':
        print("Starting as client...")
        client(queue)

    else:
        print(f"Unknown mode: {mode}")

if __name__ == "__main__":
    main()
