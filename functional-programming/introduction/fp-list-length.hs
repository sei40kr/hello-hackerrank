-- fp-list-length.hs
-- author: Seong Yong-ju ( @sei40kr )
len :: [a] -> Int
len [] = 0
len (_:xs) = 1 + len xs

main :: IO ()
main = print $ len [2, 5, 1, 4, 3, 7, 8, 6, 0, 9]
