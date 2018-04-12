main :: IO ()
main = do
  x <- readLn
  y <- readLn
  putStr $ unlines $ map unwords $ map (map show) $ matrix x y

matrix :: Int -> Int -> [[Int]]
-- #@@range_begin(list_comprehension)
matrix x y = [[i * j | j <- [1 .. y]] | i <- [1 .. x]]
-- #@@range_end(list_comprehension)
