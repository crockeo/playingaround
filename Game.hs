module Game where

import LevelLoader
import Graphics
import Level

-- Starting the game
start :: FilePath -> IO Int
start path = loadLevel path >>= gameLoop

-- Ending the game
end :: IO Int
end = return 0

-- Game functions! Yay!
updateGame :: Level -> Int -> IO Level
updateGame level input
  | input > (getChoicesSize level) = return level
  | input < 1 = return level
  | otherwise = return $ getSubLevel level (input - 1)

gameLoop :: Level -> IO Int
gameLoop (Level msg _ _ True) = do
  if msg /= ""
    then do
      putStrLn msg
      getLine
      end
    else end

gameLoop level = do
  drawLevel level
  input <- getLine
  updateGame level (read input) >>= gameLoop