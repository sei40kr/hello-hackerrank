-- functional-programming-warmups-in-recursion---gcd.hs
-- author: Seong Yong-ju ( @sei40kr )
gcd' :: Int -> Int -> Int
gcd' n m
  | n == 0 = m
  | n < m = gcd' (mod m n) n
  | otherwise = gcd' m n

main :: IO ()
main = do
  print $ gcd' 1 5
  print $ gcd' 10 100
  print $ gcd' 22 131
