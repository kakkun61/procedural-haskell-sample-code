import Data.Foldable (for_)
import qualified Data.Vector.Mutable as V

main :: IO ()
main = do
  array <- V.replicate 10 True
  V.write array 4 False
  for_ [0 .. 9] $ \i -> do
    b <- V.read array i
    putStrLn $ (show i) ++ ": " ++ (show b)
