import Control.Monad.ST (runST)
import Data.Foldable (for_)
import Data.STRef (modifySTRef, newSTRef, readSTRef)
import qualified Data.Vector.Mutable as V

maxVal :: Int
maxVal = 200

maxCheck :: Int
maxCheck = ceiling (sqrt (fromIntegral maxVal :: Double))

main :: IO ()
main = putStr $ unlines $ map show primes

primes :: [Int]
primes = runST $ do
  prime <- V.replicate (maxVal + 1) True
  for_ [2 .. maxCheck] $ \i ->
    for_ [2 * i, 3 * i .. maxVal] $ \j ->
      V.write prime j False
  resultRef <- newSTRef []
  for_ [maxVal, maxVal - 1 .. 2] $ \i -> do
    b <- V.read prime i
    if b
      then modifySTRef resultRef (i:)
      else pure ()
  readSTRef resultRef
