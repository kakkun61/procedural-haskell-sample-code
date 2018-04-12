import Data.IORef (newIORef, modifyIORef, readIORef, writeIORef)

main :: IO ()
main = do
  ref <- newIORef (0 :: Int) -- (1)
  modifyIORef ref (+ 1)      -- (2)
  n0 <- readIORef ref        -- (3)
  print n0 -- ==> 1             (4)
  writeIORef ref 10          -- (5)
  n1 <- readIORef ref
  print n1 -- ==> 10
