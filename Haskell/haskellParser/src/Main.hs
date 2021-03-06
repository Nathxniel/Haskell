module Main
  ( main
  ) where

import HParser

import System.IO (readFile, writeFile)
import System.Environment (getArgs)

import Control.Monad
import Control.Applicative ((<$>))
import Data.List (lines, unlines)

main :: IO ()
main = do
  [readfile, writefile] <- getArgs
  (parse <$> readFile readfile) >>= (writeFile writefile)
--main = getContents >>= print . lines
