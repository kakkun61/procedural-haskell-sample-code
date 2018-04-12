import Data.Traversable (for)
import Data.Foldable (for_)
import System.IO (hFlush, stdout)

main :: IO ()
main = do
  result <-
    for [0..3 :: Int] $ \i -> do -- (1)
      putStr $ (show i) ++ ": "
      hFlush stdout
      getLine
  print result                   -- (2)

  for_ [0..3 :: Int] print       -- (3)
