def create_symbol_table(filename, absolute_flag):
  from lc3_symbol_table import SymbolTable
  symbol_table = SymbolTable(filename)

  if absolute_flag != 'abs':
    import os
    currentpath = os.path.dirname(os.path.abspath(__file__)) + os.path.sep
    filename = currentpath + filename

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
          symbol_table.add(tokens[0], current_line)
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
