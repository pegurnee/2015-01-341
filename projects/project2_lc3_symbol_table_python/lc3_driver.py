import os
import sys
import lc3_asm_reader

def main():
  if len(sys.argv) == 2:
    filepath = os.path.dirname(os.path.abspath(__file__)) + os.path.sep + sys.argv[1]
  else:
    filepath = input('Please enter the pathname of file to create: ')

  if not os.path.isfile(filepath):
    print('file path is not a file.')
    return
  
  table = lc3_asm_reader.create_symbol_table(filepath)
  table.display()

if __name__ == '__main__':
  main()
