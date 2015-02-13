class SymbolTable:
  '''
  Symbol Table made for use to store address locations
  of labels that exist in a file of code.
  @author: Eddie Gurnee
  @contact: egurnee@emich.edu
  '''
  def __init__(self, filename):
    '''
    Makes a lookup table that is used to store the addresses
    and labels of a file of code, and is capable of displaying
    them prettily.
    :param filename: the name of the file that the symbol table
    is being constructed from
    '''
    self.table = {}
    self.filename = filename
  def __str__(self):
    '''
    The very pretty display of the symbol table.
    '''
    label_length = 20
    start_offset = 4
    buffer_around_filename = 1
    length_of_hex_number = 6
    length_of_file_extension = -4
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
    
    return display_string
  def add(self, label, address):
    '''
    Adds a new label=>address to the symbol table if the
    label does not already exist in the symbol table. Returns
    0 if the label already exists.
    :param label: the label to add to the symbol table
    :param address: the address to add with the label
    '''
    if not self.getAddress(label):
      self.table[label] = address
    else:
      return 0
  def getPairByAddress(self, address):
    '''
    Returns the key=>value pair of label=>address that
    exists in the symbol table if the given address exists
    in the table. If the address does not exist in the symbol
    table, returns 0.
    :param address: the address whose pair to look up
    '''
    for key in self.table.keys():
      if self.table[key] == address:
        return key, self.table[key]
    return 0
  def getPairByLabel(self, label):
    '''
    Returns the key=>value pair of label=>address that
    exists in the symbol table if the given label exists
    in the table. If the label does not exist in the symbol
    table, returns 0.
    :param label: the label whose pair to look up
    '''
    for key in self.table.keys():
      if key == label:
        return key, self.table[key]
    return 0
  def getLabel(self, address):
    '''
    Returns the string label of a given integer address in 
    the symbol table, if the address does not have an 
    associated label existing in the symbol table, returns 0.
    :param address: the address whose label to look up
    '''
    for key in self.table.keys():
      if self.table[key] == address:
        return key
    return 0
  def getAddress(self, label):
    '''
    Returns the integer address location of a label in the 
    symbol table, if the label does not exist in the symbol 
    table, returns 0.
    :param label: the label whose address to look up
    '''
    for key in self.table.keys():
      if key == label:
        return self.table[key]
    return 0
  def display(self, outfile=''):
    '''
    Displays the symbol table in pretty formatting, to a file
    or the console. Labels cannot be longer than 20 characters,
    and each location is given in hex.
    :param outfile: a flag if set to 'f' will create the file 
    <<filename>>.sym and display the symbol table inside
    '''
    display_string = self.__str__()
    
    if outfile == 'f':
      import os
      outfile = os.path.dirname(os.path.abspath(__file__)) + os.path.sep + self.filename[:length_of_file_extension] + '.sym'
      file_handle = open(outfile, 'w')
      file_handle.write(display_string + '\n')
      file_handle.close()
    else:
      print(display_string)
