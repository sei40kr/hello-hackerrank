{-# LANGUAGE FlexibleInstances, UndecidableInstances, DuplicateRecordFields #-}

module Main where

import Control.Monad
import Data.Bits
import Data.Char
import System.Environment
import System.IO

-- two-strings.hs --- Two Strings

-- author: Seong Yong-ju <sei40kr@gmail.com>

-- Complete the twoStrings function below.
twoStrings :: String -> String -> String
twoStrings s1 s2 =
  if result then "YES" else "NO"
  where
    a = ord 'a'
    f = foldl (.|.) (0 :: Integer) . map (bit . (-a +) . ord)
    result = f s1 .&. f s2 /= 0

main :: IO ()
main = do
    stdout <- getEnv "OUTPUT_PATH"
    fptr <- openFile stdout WriteMode

    q <- readLn :: IO Int

    forM_ [1..q] $ \q_itr -> do
        s1 <- getLine

        s2 <- getLine

        let result = twoStrings s1 s2

        hPutStrLn fptr result

    hFlush fptr
    hClose fptr
