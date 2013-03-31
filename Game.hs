module Game where

import LevelLoader
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

drawChoices :: Level -> Int -> IO ()
drawChoices level index
  | index >= (length $ getChoices level) = return ()
  | otherwise = do
    putStrLn (show (index + 1) ++ ". " ++ (getChoice level index))
    drawChoices level (index + 1)

drawGame :: Level -> IO ()
drawGame level = do
  putStrLn "\n\n"
  putStrLn $ getMessage level
  drawChoices level 0
  putStr ": "

gameLoop :: Level -> IO Int
gameLoop level
  | isEnd level = end
  | otherwise = do
    drawGame level
    input <- getLine
    updateGame level (read input) >>= gameLoop