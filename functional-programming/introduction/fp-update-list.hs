-- fp-update-list.hs
-- author: Seong Yong-ju ( @sei40kr )
f :: [Int] -> [Int]
f = map abs

main :: IO ()
main = print $ f [2, -4, 3, -1, 23, -4, -54]
