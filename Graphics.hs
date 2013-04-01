module Graphics where

import Level

-- Drawing all choices
drawChoices :: [String] -> Int -> IO ()
drawChoices [] n = return ()
drawChoices (x:xs) n = do
  putStrLn (show (n + 1) ++ ". " ++ x)
  drawChoices xs (n + 1)

-- Drawing a level
drawLevel :: Level -> IO ()
drawLevel level = do
  putStrLn "\n\n"
  putStrLn $ getMessage level
  drawChoices (getChoices level) 0
  putStr ": "