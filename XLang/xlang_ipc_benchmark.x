# xlang_ipc_benchmark.x

import time

# Define global variables
data = None
data_len = 0
slice_len = 0
current_position = 0

# Server functions
def PrepareData(length, slice_length):
    global data
    global data_len
    global slice_len
    global current_position
    data_len = length
    slice_len = slice_length
    data = bytes(data_len,48,122,GenData = True)
    current_position = 0
    print("Data prepared with length ${data_len} and slice length ${slice_len}")

def GetData():
    global current_position
    if current_position >= data_len:
        return None
    end_position = current_position + slice_len
    if  end_position > data_len:
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

# Main function
def main():
    args = get_args()
    if args.size() > 0:
        mode = args[0]
    else:
        mode = 'client'

    if mode == 'server':
        register_remote_object("ipc_srv")
        PrepareData(1024*1024*1024, 1024*1024*32)
        # Run as server
        print("Starting as server...")
        lrpc_listen(9089,True)

    elif mode == 'client':
        # Run as client
        import ipc_srv thru 'lrpc:9089' as server

        print("Starting as client...")
        start_time = time.time()

        while True:
            slice_data = server.GetData()
            if slice_data == None:
                break
            # Process the slice_data if needed (e.g., summing the data)
            # For benchmarking, we'll just continue to fetch the data

        end_time = time.time()
        elapsed_time = end_time - start_time

        server.close()
        print("Time taken to fetch and process the large data: ${elapsed_time} seconds")

    else:
        print("Unknown mode: ${mode}")

# Run the main function
main()
input()