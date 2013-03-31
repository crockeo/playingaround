module LevelLoader where

import System.IO

import Level

-- Some constants
messagePrefix = "msg"
choicePrefix = "chc"
sublevelPrefix = "lvl"

-- Checking if a [String] is a certain message
isMessage :: [String] -> Bool
isMessage sline = length sline == 2 && sline !! 0 == messagePrefix

isChoice :: [String] -> Bool
isChoice sline = length sline == 2 && sline !! 0 == choicePrefix

isSubLevel :: [String] -> Bool
isSubLevel sline = length sline == 2 && sline !! 0 == sublevelPrefix

-- Parsing specific messages
parseMessage :: Level -> [String] -> IO Level
parseMessage level sline = return $ setMessage level (sline !! 1)

parseChoice :: Level -> [String] -> IO Level
parseChoice level sline = return $ addChoice level (sline !! 1)

parseSubLevel :: Level -> [String] -> IO Level
parseSubLevel level sline = do
  llevel <- loadLevel $ sline !! 1
  return $ addSubLevel level llevel

-- Parsing a line
parseLine :: Level -> String -> IO Level
parseLine level line
  | isMessage psline = parseMessage level psline
  | isChoice psline = parseChoice level psline
  | isSubLevel psline = parseSubLevel level psline
  | otherwise = return level
  where sline = words line
        psline = [(sline !! 0)] ++ [(unwords $ tail sline)]

-- Parsing all lines of a file
parseLines :: [String] -> Level -> IO Level
parseLines [] level = return level
parseLines (x:xs) level = (parseLine level x) >>= parseLines xs

-- Loading a level from a file
loadLevel :: FilePath -> IO Level
loadLevel path = do
  fread <- readFile path
  level <- parseLines (lines fread) createEmptyLevel
  return $ fillEmptySpace level