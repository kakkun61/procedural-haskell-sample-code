import Data.Foldable (for_)
import qualified Data.Vector as V

main :: IO ()
main = do
  let array = V.generate 10 $ \i -> if i == 4 then True else False
  for_ [0 .. 9] $ \i -> putStrLn $ (show i) ++ ": " ++ (show $ array V.! i)
