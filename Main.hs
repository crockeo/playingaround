module Main where

import System.Environment
import System.Directory

import qualified Game

fileName = "Test.lvl"

main :: IO Int
main = do
  fileExists <- doesFileExist fileName

  if fileExists
      then Game.start fileName
      else return 1