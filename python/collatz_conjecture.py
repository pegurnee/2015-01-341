def main():
  num = int(input('What number are you conjecture-ing? '))
  count = 0
  while (num != 1):
    if is_odd(num):
      num = do_odd(num)
    else:
      num = do_even(num)
    count += 1
  print('Stopping time is %s.' % count)

def do_odd(num):
  return num * 3 +1
      
def do_even(num):
  return num / 2

def is_odd(num):
  return num % 2

if __name__=='__main__':
  main()
