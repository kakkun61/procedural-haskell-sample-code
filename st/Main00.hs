import Prelude hiding (break)
import Control.Monad (when)
import Control.Monad.IO.Class (liftIO)
import Data.IORef (newIORef, readIORef, writeIORef)

import Procedural (for_)

main :: IO ()
main = do
  n <- f
  print n

f :: IO Int
f = do
  nRef <- newIORef (0 :: Int)
  for_ [1 .. 9] $ \i break -> do
    n <- liftIO $ readIORef nRef
    let n' = n + i
    when (n' > 40) break
    liftIO $ writeIORef nRef n'
  readIORef nRef
