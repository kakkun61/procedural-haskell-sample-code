import Data.Foldable (for_)
import qualified Data.Vector as V
import qualified Data.Vector.Mutable as MV

main :: IO ()
main = do
  array <- MV.replicate 10 True
  MV.write array 4 False
  iarray <- V.freeze array
  for_ iarray $ print
