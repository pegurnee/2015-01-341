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
  
  outfile = open(filepath + '.dat', 'w')
  with open(filepath) as file:
    for line in file:
      if line.strip():
        line = '"' + line.strip() + '"\n'
      outfile.write(line)
      
  outfile.close()
  
if __name__ == '__main__':
  main() 