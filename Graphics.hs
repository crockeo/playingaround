module Graphics where

import Level

-- Drawing the message
drawMessage :: Level -> IO ()
drawMessage level = do
  putStrLn "\n\n"
  putStrLn $ getMessag level

-- Drawing all choices
drawChoices :: [String] -> Int -> IO ()
drawChoices [] n = return ()
drawChoices (x:xs) n = do
  putStrLn (show (n + 1) ++ ". " ++ x)
  drawChoices xs (n + 1)

-- Drawing a level
drawLevel :: Level -> IO ()
drawLevel level = do
  drawMessage level
  drawChoices (getChoices level) 0
  putStr ": "