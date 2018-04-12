import Prelude hiding (break)
import Control.Monad (when)
import Control.Monad.ST (runST)
import Control.Monad.Trans.Class (lift)
import Data.STRef (newSTRef, readSTRef, writeSTRef)

import Procedural (for_)

main :: IO ()
main = print f

f :: Int
f = runST $ do
  nRef <- newSTRef (0 :: Int)
  for_ [1 .. 9] $ \i break -> do
    n <- lift $ readSTRef nRef
    let n' = n + i
    when (n' > 40) break
    lift $ writeSTRef nRef n'
  readSTRef nRef
