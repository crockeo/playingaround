module Main where

import System.Environment
import System.Directory

import qualified Game

configLoc = "config.cfg"

-- Loading the filename from a file string
loadFileName :: FilePath -> IO String
loadFileName path = readFile path

main :: IO Int
main = do
  exists <- doesFileExist configLoc
  if exists
    then (loadFileName configLoc) >>= Game.start
    else return 1