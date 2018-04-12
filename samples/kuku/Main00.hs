import Data.Foldable (for_)

main :: IO ()
main = do
  x <- readLn :: IO Int
  y <- readLn :: IO Int
  for_ [1 .. x] $ \i ->
    for_ [1 .. y] $ \j ->
      putStr $
        if j == y
          then show (i * j) ++ "\n"
          else show (i * j) ++ " "
