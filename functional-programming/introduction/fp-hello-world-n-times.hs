-- fp-hello-world-n-times.hs
-- author: Seong Yong-ju ( @sei40kr )
import Control.Applicative
import Control.Monad
import System.IO

main :: IO ()
main = do
  n_temp <- getLine
  let n = read n_temp :: Int
    --  Print "Hello World" on a new line 'n' times.
  replicateM_ n $ putStrLn "Hello World"

getMultipleLines :: Int -> IO [String]
getMultipleLines n
  | n <= 0 = return []
  | otherwise = do
    x <- getLine
    xs <- getMultipleLines (n - 1)
    let ret = (x : xs)
    return ret
