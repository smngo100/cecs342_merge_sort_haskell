-- Main.hs
--
-- CECS 342 Assignment 4
-- Merge sort in Haskell

module Main where

-- Merge sort a list.
msort :: Ord a => [a] -> [a]
msort = error "Implement the msort function!"

-- Call a sort function and print input and output.
testSort sort input = do
  putStr "Input:  "
  print input
  putStr "Sorted: "
  print (sort input)

-- Call some tests.
main = do
  putStrLn "CECS 342 Assignment 4"
  putStrLn "Name: Sophia Ngo"
  putStrLn "Algorithm: merge sort, Language: Haskell"
  
  testSort msort ([]::[Int])
  testSort msort [1]
  testSort msort [3, 2, 1]
  testSort msort [102, -43, 5, 645, 4, 34, -6, 776, 445, 45]
  testSort msort ["the",  "quick",  "brown", "fox",
                  "jumps", "over", "the", "lazy", "dog"]