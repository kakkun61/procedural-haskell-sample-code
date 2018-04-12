module Main where

import Prelude hiding (break)    -- (1)
import Control.Monad (when)
import Control.Monad.Trans.Class (lift)
import Data.IORef (newIORef, readIORef, writeIORef)

import Procedural (for_)

main :: IO ()
main = do
  nRef <- newIORef (0 :: Int)
  for_ [1 .. 9] $ \i break -> do -- (2)
    n <- lift $ readIORef nRef   -- (3)
    let n' = n + i
    when (n' > 40) break         -- (4)
    lift $ writeIORef nRef n'
  n <- readIORef nRef
  print n
