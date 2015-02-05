import sys
import os

def main():
  if len(sys.argv) == 2:
    filepath = os.path.dirname(os.path.abspath(__file__)) + os.path.sep + sys.argv[1]
  else:
    filepath = input('Please enter the pathname of file to format: ', '')
  
  if not os.path.isfile(filepath):
    print('file path is not a file.')
    return

  var_check1 = False
  var_check2 = False
  string_literal = ''
  outfile = open(filepath + '.new', 'w')
  with open(filepath) as file:
    for line in file:
      for ch in line:
        if string_literal:
          if string_literal == ch:
            string_literal = ''
          outfile.write(ch)
        elif '\'' in ch or '"' in ch:
          string_literal = ch
          outfile.write(ch)
        elif ch.isalpha():
          if ch.isupper():
            if var_check2:
              outfile.write('_')
              var_check2 = False
            var_check1 = True
          elif var_check1:
            var_check2 = True
          outfile.write(ch.lower())
        else:
          var_check2 = False
          outfile.write(ch)
          
  outfile.close()

if __name__ == '__main__':
  main() 
