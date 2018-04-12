import Data.Foldable (for_)
import qualified Data.Vector as V
import qualified Data.Vector.Mutable as MV

main :: IO ()
main = do
  iarray <- f
  for_ iarray $ print

f :: IO (V.Vector Bool)
f = do
  array <- MV.replicate 10 True
  MV.write array 4 False
  V.freeze array
