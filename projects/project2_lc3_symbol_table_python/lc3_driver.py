import os
import sys
import lc3_asm_reader

def main():
  if len(sys.argv) == 2:
    filepath = sys.argv[1]
  else:
    filepath = input('Please enter the pathname of file to create: ')
    if not filepath:
      filepath = 'multiply.asm'
      
  if filepath == 'test':
    files = ['multiply.asm', 'lab10.asm', 'p1.asm', 'p2.asm', 'p3.asm'];
    for file in files:
      table = lc3_asm_reader.get_symbol_table(file)
      table.display();
    return
  if not os.path.isfile(filepath):
    print('file path is not a file.')
    return

  table = lc3_asm_reader.get_symbol_table(filepath)
  table.display()

if __name__ == '__main__':
  main()
