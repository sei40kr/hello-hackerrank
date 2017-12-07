-- fp-filter-positions-in-a-list.hs
-- author: Seong Yong-ju ( @sei40kr )
f :: [Int] -> [Int]
f [] = []
f [_] = []
f (_:x:xs) = x : f xs

main :: IO ()
main = print $ f [2, 5, 3, 4, 6, 7, 9, 8]
