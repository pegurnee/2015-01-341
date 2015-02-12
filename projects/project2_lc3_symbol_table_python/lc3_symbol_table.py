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
  def display(self, outfile=''):
    '''
    Displys a symbol table given a filename and symbol table,
    labels cannot be longer than 20 characters, and each location
    is given in hex.
    :param outfile: the name of the file where the display to be 
    saved, defaults to be printed to console
    '''
    label_length = 20
    start_offset = 4
    buffer_around_filename = 1
    length_of_hex_number = 6
    number_of_dividers = 3
    number_of_buffers_around_labels = 4
    number_of_buffers_around_filename = 2
    output_length = label_length + len(' ' * number_of_buffers_around_labels) + len('|' * number_of_dividers) + length_of_hex_number

    display_string = (('-' * start_offset)
    	+ (' ' * buffer_around_filename) 
    	+ self.filename
    	+ (' ' * buffer_around_filename) 
    	+ ('-' * (output_length - start_offset - len(self.filename) - (buffer_around_filename * number_of_buffers_around_filename)))) 
    for key in sorted(self.table.keys()):
      value = str(hex(self.table[key]))
      value = value[:2] + value[2:].upper()
      display_string += ('\n| %-' + str(label_length) + 's | %s |') % (key, value)
    display_string += '\n' + ('-' * output_length)
    
    if outfile == 'f':
      import os
      outfile = os.path.dirname(os.path.abspath(__file__)) + os.path.sep + self.filename[:-4] + '.sym'
      file_handle = open(outfile, 'w')
      file_handle.write(display_string + '\n')
      file_handle.close()
    else:
      print(display_string)
