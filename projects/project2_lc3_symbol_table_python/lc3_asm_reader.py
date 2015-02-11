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

def get_symbol_table(filename, absolute_flag='rel'):
  from lc3_symbol_table import SymbolTable
  symbol_table = SymbolTable(filename)

  if absolute_flag != 'abs':
    import os
    currentpath = os.path.dirname(os.path.abspath(__file__)) + os.path.sep
    filename = currentpath + filename

  current_line = 0
  with open(filename) as file:
    for line in file:
      if line.strip():
        #print(line)
        label, numlines = decode_line(line)
        if label[0] != '.':
          symbol_table.add(label, current_line)
        current_line += numlines
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
  tokens = line.strip().split(None, 1)
  if tokens[0][0] == '.':
    tokens[0] = tokens[0].lower()
    if tokens[0] == '.orig':
      return '.orig', int('0' + tokens[1].lower(), 16)
    elif tokens[0] == '.end':
      return '.end', 1
  elif tokens[0][0] == ';':
      return '.none', 0

  if not is_lc3_instruction(tokens[0]):
    label = tokens[0]
    tokens = tokens[1].split(None, 1)
    if tokens[0][0] == '.':
      tokens[0] = tokens[0].lower()
      if tokens[0] == '.fill':
        return label, 1
      elif tokens[0] == '.blkw':
        return label, int(tokens[1].split()[0])
      elif tokens[0] == '.stringz':
        return label, len(tokens[1][1:tokens[1].index('"', 1)]) + 1
    else:
      return label, 1

  return '.none', 1
