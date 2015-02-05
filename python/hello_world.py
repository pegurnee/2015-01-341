import sys

# hello world
def main():
    if len(sys.argv) == 1:
        print ('Hello World')
    else:
        print ('Hello world', sys.argv[1])

if __name__ == '__main__':
    main()
