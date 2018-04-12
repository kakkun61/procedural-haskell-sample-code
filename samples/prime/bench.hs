import Criterion.Main (bench, defaultMain, nf)
import Control.Monad.ST (runST)
import Data.Foldable (for_)
import Data.STRef (modifySTRef, newSTRef, readSTRef)
import qualified Data.Vector.Mutable as V

main :: IO ()
main =
  defaultMain
    [ bench "procedural" $ nf id primesProcedural
    , bench "functional" $ nf id primesFunctional
    ]

maxVal :: Int
maxVal = 10 ^ (5 :: Int)

maxCheck :: Int
maxCheck = ceiling (sqrt (fromIntegral maxVal :: Double))

primesProcedural :: [Int]
primesProcedural = runST $ do
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

primesFunctional :: [Int]
primesFunctional =
  takeWhile (<= maxVal) $ sieve [2 ..]
  where
    sieve :: [Int] -> [Int]
    sieve (n:r) = n : sieve (filter (\x -> x `mod` n /= 0) r)
    sieve [] = []
