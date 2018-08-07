-- ctci-array-left-rotation.hs --- Arrays: Left Rotation

-- author: Seong Yong-ju <sei40kr@gmail.com>

{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE UndecidableInstances  #-}

module Main where

import           Control.Monad
import           Data.Array
import           Data.Bits
import           Data.List
import           Data.List.Split
import           Data.Set           hiding (drop, take)
import           Debug.Trace
import           System.Environment
import           System.IO
import           System.IO.Unsafe

-- Complete the rotLeft function below.
rotLeft a d = take (length a) (drop d (cycle a))

readMultipleLinesAsStringArray :: Int -> IO [String]
readMultipleLinesAsStringArray 0 = return []
readMultipleLinesAsStringArray n = do
    line <- getLine
    rest <- readMultipleLinesAsStringArray(n - 1)
    return (line : rest)

main :: IO ()
main = do
    stdout <- getEnv "OUTPUT_PATH"
    fptr <- openFile stdout WriteMode

    ndTemp <- getLine
    let nd = words ndTemp

    let n = read (nd !! 0) :: Int

    let d = read (nd !! 1) :: Int

    aTemp <- getLine

    let a = Data.List.map (read :: String -> Int) . words $ aTemp

    let result = rotLeft a d

    hPutStrLn fptr $ intercalate " " $ Data.List.map (\x -> show x) $ result

    hFlush fptr
    hClose fptr
