main :: IO ()
main = do
  x <- readLn
  y <- readLn
  putStr $ unlines $ map unwords $ map (map show) $ matrix x y

matrix :: Int -> Int -> [[Int]]
matrix x y = do
  i <- [1 .. x]
  pure $ do
    j <- [1 .. y]
    pure $ i * j
