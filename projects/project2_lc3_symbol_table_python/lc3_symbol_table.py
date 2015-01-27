class SymbolTable:
	def __init__(self, filename):
		self.table = []
		self.filename = filename
	def add(self, label, address):
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
		for tuple in self.table:
			value = str(hex(tuple[1]))
			value = value[:2] + value[2:].upper()
			print(('| %-' + str(label_length) + 's | %s |') % (tuple[0], value))
		print('-' * output_length)
