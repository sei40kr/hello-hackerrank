-- fp-list-replication.hs
-- author: Seong Yong-ju ( @sei40kr )
f :: Int -> [Int] -> [Int]
f n = (=<<) (replicate n)

main :: IO ()
main = print $ f 3 [1, 2, 3, 4]
