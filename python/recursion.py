def fact(num):
    if num < 0:
        return -1
    elif num == 0:
        return 1
    else:
        return num * fact(num -1)

def fib(num):
    if num < 1:
        return -1
    elif num <= 2:
        return 1
    else:
        return fib(num - 1) + fib(num - 2)

def count_elements(a_list):
    if not a_list:
        return 0
    else:
        return 1 + count_elements(a_list[1:])

def print_atom(a_list):
    if a_list:
        if isinstance(a_list[0], list):
            print_atom(a_list[0])
        else:
            print(a_list[0])
        print_atom(a_list[1:])
