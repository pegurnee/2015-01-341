class SymbolTable:
  def __init__(self):
    self.table = []
  def addLabel(self, label, address):
    tuple = (label, address)
    self.table.append(tuple)
  def getPairByLabel(self, label):
    to_return = ()
    for tuple in self.table:
      if tuple[0] == label:
        to_return = tuple
        break
    return to_return
  def getPairByAddress(self, address):
    to_return = ()
    for tuple in self.table:
      if tuple[1] == address:
        to_return = tuple
        break
    return to_return
  def getLabel(self, address):
    to_return = ''
    for tuple in self.table:
      if tuple[1] == address:
        to_return = tuple[0]
        break
    return to_return
  def getAddress(self, label):
    to_return = -1
    for tuple in self.table:
      if tuple[0] == label:
        to_return = tuple[1]
        break
    return to_return
  
