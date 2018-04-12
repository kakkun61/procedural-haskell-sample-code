maxVal :: Int
maxVal = 200

main :: IO ()
main = putStr $ unlines $ map show primes

primes :: [Int]
primes =
  takeWhile (<= maxVal) $ sieve [2 ..]
  where
    sieve :: [Int] -> [Int]
    sieve (n:r) = n : sieve (filter (\x -> x `mod` n /= 0) r)
    sieve [] = []
