module LevelLoader where

import System.IO

import Level

-- Some constants
messagePrefix = "msg"
choicePrefix = "chc"
sublevelPrefix = "lvl"
endPrefix = "end"

-- Checking if a [String] is a certain message
isMessage :: [String] -> Bool
isMessage sline = length sline == 2 && sline !! 0 == messagePrefix

isChoice :: [String] -> Bool
isChoice sline = length sline == 2 && sline !! 0 == choicePrefix

isSubLevel :: [String] -> Bool
isSubLevel sline = length sline == 2 && sline !! 0 == sublevelPrefix

isEnd :: [String] -> Bool
isEnd sline = length sline == 1 && sline !! 0 == endPrefix

-- Parsing specific messages
parseMessage :: Level -> [String] -> IO Level
parseMessage level sline =
  if isMessage sline
    then return $ setMessage level (sline !! 1)
    else return level

parseChoice :: Level -> [String] -> IO Level
parseChoice level sline =
  if isChoice sline
    then return $ addChoice level (sline !! 1)
    else return level

parseSubLevel :: Level -> [String] -> IO Level
parseSubLevel level sline =
  if isSubLevel sline
    then do
      llevel <- loadLevel $ sline !! 1
      return $ addSubLevel level llevel
    else return level

parseEnd :: Level -> [String] -> IO Level
parseEnd level sline =
  if LevelLoader.isEnd sline
    then return $ setEnd level True
    else return level

-- Parsing a line
parseLine :: Level -> String -> IO Level
parseLine level line
  | isMessage psline = parseMessage level psline
  | isChoice psline = parseChoice level psline
  | isSubLevel psline = parseSubLevel level psline
  | LevelLoader.isEnd psline = parseEnd level psline
  | otherwise = return level
  where sline = words line
        psline = if length sline == 1
          then sline
          else [(sline !! 0)] ++ [(unwords $ tail sline)]

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