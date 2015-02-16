import os
import lc3_asm_reader

def main():
  filepath = input('Please enter the pathname of file to check: ')
  if not filepath:
    filepath = 'p1.asm'
  
  if not os.path.isfile(filepath):
    print('file path is not a file.')
    return
  
  actual = {}
  expected = {}
  
  table = lc3_asm_reader.get_symbol_table(filepath)
  display = table.__str__()
  display = display.split('\n')
  
  for line in display:
    if line[0] == '|':
      the_line = line.split()
      actual[the_line[1]] = the_line[3][2:]
      print(line)
  print(actual)
  
  with open(filepath[:-4]+'.sym') as file:
    for line in file:
      if line[2] == '\t':
        the_line = line.split()
        expected[the_line[1]] = the_line[2]
        print(line.strip())
  print(expected)
  
  if actual == expected:
    print('great success')
  else:
    print('fail')
  
if __name__ == '__main__':
  main()