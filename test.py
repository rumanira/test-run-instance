import sys
import time
import random

def print_argument():
    if len(sys.argv) != 2:
        print("Please provide exactly one argument.")
    else:
        try:
            print(sys.argv[1])
            random_number = random.randint(1,30)
            print(f"sleep for {random_number} seconds")
            time.sleep(random_number)
            print("selesai")
            divisor = random_number % 2
            random_number / divisor
            print("horee")
            raise NotImplementedError
        except ZeroDivisionError as e:
            print(f"a restartable error occurs: {e}")
            sys.exit(1)
        except:
            print(f"non-restartable error occur")

if __name__ == "__main__":
    print_argument()
    sys.exit(0)