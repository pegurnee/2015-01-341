opcodes = [
  'add', 'and', 'not', 'ld', 'ldi', 'ldr',
  'st', 'sti', 'str', 'lea', 'br', 'brn',
  'brz', 'brp', 'brnz', 'brnp', 'brzp', 'brnzp',
  'jsr', 'jsrr', 'jmp', 'rti', 'trap'
]
directives = [
  '.orig', '.fill',
  '.blkw', '.stringz',
  '.end'
]
pseudoops = [
  'getc', 'out',
  'puts', 'in',
  'putsp', 'halt'
]
