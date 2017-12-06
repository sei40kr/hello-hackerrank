-- functional-programming-warmups-in-recursion---fibonacci-numbers.hs
-- author: Seong Yong-ju ( @sei40kr )
fib :: Int -> Int
fib n
  | n == 2 = 1
  | n > 2 = fib (n - 2) + fib (n - 1)
  | otherwise = 0

main :: IO ()
main = do
  print $ fib 3
  print $ fib 4
  print $ fib 5
