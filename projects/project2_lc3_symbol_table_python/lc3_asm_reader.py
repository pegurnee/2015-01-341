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
def directive_analysis(line_segment, label='.none'):
  #print(line_segment)
  directive = line_segment.lower().strip().split(None, 1)
  if directive[0] == '.orig':
    return '.orig', int('0' + directive[1].lower(), 16)
  elif directive[0] == '.end':
    return '.end', 1
  elif directive == '.fill':
    return label, 1
  elif directive == '.blkw':
    return label, int(tokens[1].split()[0])
  elif directive == '.stringz':
    return label, len(tokens[1][1:tokens[1].index('"', 1)]) + 1
  
def decode_line(line):
  line = line.strip();
  tokens = line.strip().split(None, 1)
  if line[0] == ';':
    return '.none', 0
  if line[0] == '.':
    return directive_analysis(line)
  if is_lc3_instruction(tokens[0]):
    return '.none', 1

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

