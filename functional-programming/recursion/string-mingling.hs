-- string-mingling.hs
-- author: Seong Yong-ju ( @sei40kr )
import Control.Applicative

mingle :: String -> String -> String
mingle p q = concat [[x, y] | (x, y) <- zip p q]

main :: IO ()
main = do
  putStrLn =<< mingle <$> getLine <*> getLine
