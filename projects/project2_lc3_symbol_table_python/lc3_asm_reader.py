def get_symbol_table(filename, absolute_flag='r'):
  '''
  Returns a SymbolTable object from a given file.
  :param filename: the name of the file to generate a
  symbol table
  :param absolute_flag: if the flag is set to absolute then
  the filename string is absolute
  '''
  from lc3_symbol_table import SymbolTable
  symbol_table = SymbolTable(filename)

  if absolute_flag != 'a':
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
  '''
  Returns true if a given token is an lc3 opcode or
  pseudo_op.
  :param token: a string to test against the list of
  opcodes and pseudo_ops
  '''
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
  '''
  Checks what lc3 directive was used, returns the label
  of the line that directive sits on, and the number of
  lines that directive will take up. If no label exists,
  '.none' is returned.
  :param line_segment: the part of the line of code that
  starts with an assembler directive
  :param label: the label of the line that a given directive
  is on, if it exists
  '''
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
  '''
  Takes in a line of code and returns the relevant symbol 
  table information: label (if applicable) and number of lines 
  the label takes up.
  :param line: the line of code to interpret
  '''
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

