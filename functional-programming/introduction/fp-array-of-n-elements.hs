-- fp-array-of-n-elements.hs
-- author: Seong Yong-ju ( @sei40kr )
fn :: Int -> [Int]
fn n
  | n > 0 = fn (n - 1) ++ [n]
  | otherwise = []

main :: IO ()
main = print $ fn 3
