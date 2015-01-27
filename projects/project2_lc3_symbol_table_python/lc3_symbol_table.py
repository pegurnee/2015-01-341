def create_symbol_table(filename, absolute_flag):
  if absolute_flag != 'abs':
    import os
    currentpath = os.path.dirname(os.path.abspath(__file__)) + os.path.sep
    filename = currentpath + filename  
  symbol_table = {}
  current_line = 0
  with open(filename) as file:
    for line in file:
      line = line.strip()
      if line[0] == '.':
        tokens = line.lower().split()
        if tokens[0] == '.orig':
          current_line = int(tokens[1][1:])
        print('**cmd**')
      elif line[0] == ';':
        print('**was comment**')
      else:
        tokens = line.split()
        if not is_lc3_instruction(tokens[0]):
          symbol_table[tokens[0]] = current_line
          print('>>label: %s @%s' % (tokens[0], current_line))
        else:
          print('line %s: %s' % (current_line, line))
        current_line += 1
  return symbol_table

def is_lc3_instruction(token):
  from lc3_keywords import opcodes
  for opcode in opcodes:
    if opcode == token.lower():
      return True
  return False

def display_symbol_table(filename, symbol_table):
  '''
  Displys a symbol table given a filename and symbol table,
  labels cannot be longer than 20 characters, and each location
  is given in hex.
  :param filename: the name of the file
  :param symbol_table: the dictionary that represents
    the symbol table
  '''
  for label in symbol_table.keys():
    print('| %s\t\t| x%s\t|' % (label, symbol_table[label]))
