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
  if line_segment[:4].lower() == '.end':
    return '.end', 1
  
  directive, rest_of_line = line_segment.split(None, 1)
  directive = directive.lower()
  if directive == '.orig':
    return '.orig', int('0' + rest_of_line, 16)
  elif directive == '.fill':
    return label, 1
  elif directive == '.blkw':
    return label, int(rest_of_line.split()[0])
  elif directive == '.stringz':
    return label, len(rest_of_line[1:rest_of_line.index('"', 1)]) + 1
  
def decode_line(line):
  line = line.strip();
  if line[0] == ';':
    return '.none', 0
  if line[0] == '.':
    return directive_analysis(line)
  
  tokens = line.split(None, 1)
  if is_lc3_instruction(tokens[0]):
    return '.none', 1

  label = tokens[0]
  if tokens[1][0] == '.':
    return directive_analysis(tokens[1], label)
  else:
    return label, 1

