import sys

def print_argument():
    if len(sys.argv) != 2:
        print("Please provide exactly one argument.")
    else:
        print(sys.argv[1])

if __name__ == "__main__":
    print_argument()