-- fp-reverse-a-list.hs
-- author: Seong Yong-ju ( @sei40kr )
rev :: [Int] -> [Int]
rev [] = []
rev (x:xs) = rev xs ++ [x]

main :: IO ()
main = print $ rev [19, 22, 3, 28, 26, 17, 18, 4, 28, 0]
