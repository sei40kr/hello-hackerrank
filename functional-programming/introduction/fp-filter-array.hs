-- fp-filter-array.hs
-- author: Seong Yong-ju ( @sei40kr )
f :: Int -> [Int] -> [Int]
f _ [] = []
f n (x:xs) =
  if x < n
    then x : f n xs
    else f n xs

main :: IO ()
main = print $ f 3 [10, 9, 8, 2, 7, 5, 1, 3, 0]
