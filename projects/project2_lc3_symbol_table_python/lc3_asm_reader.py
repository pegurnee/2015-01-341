def create_symbol_table(filename, absolute_flag='rel'):
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
  from lc3_keywords import pseudo_ops
  for opcode in pseudo_ops:
    if opcode == token.lower():
      return True
  return False

def decode_line(line):
  tokens = line.strip().split()
  if tokens[0][0] == '.':
    tokens[0].lower()
    if tokens[0] == '.orig':
      return 'start', int('0' + tokens[1].lower(), 16)
    elif tokens[0] == '.end':
      return 'end', 1
  elif tokens[0][0] == ';':
      return 'none', 0
  else:
    if not is_lc3_instruction(token[0]):
      if tokens[1][0] == '.':
        tokens[1] = tokens[1].lower()
        if tokens[1] == '.fill':
          return tokens[0], 1
        elif tokens[1] == '.blkw':
          return tokens[0], int(tokens[2])
        elif tokens[1] == '.stringz':
          return tokens[0], len(tokens[2]) + 1
        else:
          return tokens[0], 1
    else:
      return 'none', 1
