def are_you_a_pirate():
  print("eddie is a pirate")
def many_hellos():
  for x in range(0, 20):
    print('hello %s' % x)
    if x == 9:
      break
def even_until_age():
  age = 24
  for x in range(1, age):
    if x % 2 == 0:
      print(x)
def fav_ingredients():
  ingredients = ['snails', 'leeches', 
    'gorilla belly-button lint', 'caterpillar eyebrows',
    'centipede toes']
  i = 1
  for x in ingredients:
    print('%s %s' % (i, x))
    i += 1
def moon_weight():
  weight = 86.5
  moonWeightPercent = 0.165
  for i in range(0, 15):
    print('Year %s:\n\tYour Weight: %s\tMoon Weight: %s' 
      % (i, weight + i, (weight + i) * moonWeightPercent))
