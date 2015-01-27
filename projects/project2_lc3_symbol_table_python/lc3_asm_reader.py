def create_symbol_table(filename, absolute_flag):
  if absolute_flag != 'abs':
    import os
    currentpath = os.path.dirname(os.path.abspath(__file__)) + os.path.sep
    filename = currentpath + filename  
  # from symbol_table import SymbolTable
  symbol_table = {}
  current_line = 0
  with open(filename) as file:
    for line in file:
      line = line.strip()
      if line[0] == '.':
        tokens = line.lower().split()
        if tokens[0] == '.orig':
          current_line = int('0' + tokens[1], 16)
        print('**cmd**')
      elif line[0] == ';':
        print('**was comment**')
      else:
        tokens = line.split()
        if not is_lc3_instruction(tokens[0]):
          symbol_table[tokens[0]] = current_line
          print('>>label: %s @%s' % (tokens[0], hex(current_line)))
        else:
          print('line %s: %s' % (hex(current_line), line))
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
  label_length = 20
  start_offset = 4
  buffer = 1
  length_of_hex_number = 6
  output_length = label_length + len(' ' * 4) + len('|' * 3) + length_of_hex_number

  print(('-' * start_offset)
    + (' ' * buffer) 
    + filename
    + (' ' * buffer) 
    + ('-' * (output_length - start_offset - len(filename) - (buffer * 2)))) 
  for label in symbol_table.keys():
    value = str(hex(symbol_table[label]))
    value = value[:2] + value[2:].upper()
    print(('| %-' + str(label_length) + 's | %s |') % (label, value))
  print('-' * output_length)
