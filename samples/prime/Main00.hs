import Data.Foldable (for_)
import qualified Data.Vector.Mutable as V

maxVal :: Int
maxVal = 200

maxCheck :: Int
maxCheck = ceiling (sqrt (fromIntegral maxVal :: Double))

main :: IO ()
main = do
  prime <- V.new (maxVal + 1)
  for_ [2 .. maxVal] $ \i -> V.write prime i True
  for_ [2 .. maxCheck] $ \i ->
    for_ [2 * i, 3 * i .. maxVal] $ \j ->
      V.write prime j False
  for_ [2 .. maxVal] $ \i -> do
    b <- V.read prime i
    if b
      then putStrLn (show i)
      else pure ()
