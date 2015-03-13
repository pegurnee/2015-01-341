--fib :: Integer -> Integer
--fib 0 = 0
--fib 1 = 1
--fib a = fib (a - 1) + fib (a - 2)
trib :: Integer -> Integer
trib 0 = 0
trib 1 = 1
trib 2 = 1
trib a = trib (a - 1) + trib (a - 2) + trib (a - 3)

fib n = fibs!!n
fibs = 0 : 1 : next fibs
  where
    next (a : t@(b:_)) = (a+b) : next t

trib n = fibs!!n
tribs = 0 : 1 : 1 : next tribs
  where
    next (a : t@(b:_)) = (a+b) : next t
