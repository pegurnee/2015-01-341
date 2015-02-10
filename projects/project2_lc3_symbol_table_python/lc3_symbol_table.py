class SymbolTable:
  def __init__(self, filename):
    self.table = {}
    self.filename = filename
  def add(self, label, address):
    self.table[label] = address
  def getPairByLabel(self, label):
    to_return = ()
    for key in self.table.keys():
      if key == label:
        to_return = key, self.table[key]
        break
    return to_return
  def getPairByAddress(self, address):
    to_return = ()
    for key in self.table.keys():
      if self.table[key] == address:
        to_return = key, self.table[key]
        break
    return to_return
  def getLabel(self, address):
    to_return = ''
    for key in self.table.keys():
      if self.table[key] == address:
        to_return = key
        break
    return to_return
  def getAddress(self, label):
    to_return = -1
    for key in self.table.keys():
      if key == label:
        to_return = self.table[key]
        break
    return to_return
  def display(self):
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
    	+ self.filename
    	+ (' ' * buffer) 
    	+ ('-' * (output_length - start_offset - len(self.filename) - (buffer * 2)))) 
    for key in self.table.keys():
      value = str(hex(self.table[key]))
      value = value[:2] + value[2:].upper()
      print(('| %-' + str(label_length) + 's | %s |') % (key, value))
    print('-' * output_length)
