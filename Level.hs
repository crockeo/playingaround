module Level where

data Level = Level String [String] [Level] Bool
             deriving (Eq, Show, Read)

-- Creating an empty level
createEmptyLevel :: Level
createEmptyLevel = Level "" [] [] False

-- Creating an end level
createEndLevel :: Level
createEndLevel = setEnd (createEmptyLevel) True

-- Filling the extra difference between choices and sublevels
fillEmptySpaceRaw :: Level -> Int -> Level
fillEmptySpaceRaw level index
  | index >= (getChoicesSize level) = level
  | otherwise = fillEmptySpaceRaw (addSubLevel level createEndLevel) (index + 1)

fillEmptySpace :: Level -> Level
fillEmptySpace level
  | llen == clen = level
  | llen > clen = createEndLevel
  | otherwise = fillEmptySpaceRaw level llen
  where clen = length $ getChoices level
        llen = length $ getSubLevels level

-- Accessors
getMessage :: Level -> String
getMessage (Level a _ _ _) = a

getChoices :: Level -> [String]
getChoices (Level _ a _ _) = a

getChoice :: Level -> Int -> String
getChoice level index = getChoices level !! index

getChoicesSize :: Level -> Int
getChoicesSize level = length $ getChoices level

getSubLevels :: Level -> [Level]
getSubLevels (Level _ _ a _) = a

getSubLevel :: Level -> Int -> Level
getSubLevel level index = getSubLevels level !! index

getSubLevelsSize :: Level -> Int
getSubLevelsSize level = length $ getSubLevels level

isEnd :: Level -> Bool
isEnd (Level _ _ _ a) = a

-- Mutators
setMessage :: Level -> String -> Level
setMessage (Level _ a b c) msg = Level msg a b c

setChoices :: Level -> [String] -> Level
setChoices (Level a _ b c) chcs = Level a chcs b c

addChoice :: Level -> String -> Level
addChoice (Level a b c d) chc = Level a (b ++ [chc]) c d

setSubLevels :: Level -> [Level] -> Level
setSubLevels (Level a b _ c) lvls = Level a b lvls c

addSubLevel :: Level -> Level -> Level
addSubLevel (Level a b c d) lvl = Level a b (c ++ [lvl]) d

setEnd :: Level -> Bool -> Level
setEnd (Level a b c _) end = Level a b c end