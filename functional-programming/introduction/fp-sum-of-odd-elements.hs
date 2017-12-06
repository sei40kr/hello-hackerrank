-- fp-sum-of-odd-elements.hs
-- author: Seong Yong-ju ( @sei40kr )
f :: [Int] -> Int
f = sum . filter (\x -> mod x 2 == 1)

main :: IO ()
main = print $ f [3, 2, 4, 6, 5, 7, 8, 0, 1]
