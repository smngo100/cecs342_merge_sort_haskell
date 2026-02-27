-- Main.hs
--
-- CECS 342 Assignment 4
-- Merge sort in Haskell

{-
----- Tools Used ----- 
IDE 
- VS Code

Websites 
- Google search

- Hoogle 
    - https://hackage-content.haskell.org/package/base-4.22.0.0/docs/Prelude.html#v:splitAt

Referred to 
- Code note files from Canvas 
-}

module Main where

-- Merge sort a list.
msort :: Ord a => [a] -> [a]

-- a list of 0 or 1 elements is already sorted, so just return it
msort [] = []   -- base case: empty list
msort [x] = [x] -- base case: single element

-- resursive case: split, sort, merge
msort xs = let (left, right) = halve xs
            in merge (msort left) (msort right)

-- split a list in half 
halve :: [a] ->  ([a], [a])
halve xs = splitAt mid xs
    where mid = length xs `div` 2

-- merge two already sorted lists into one sorted list 
merge [] ys = ys    -- base case: left list empty 
                    -- left list empty, so just return right list
merge xs [] = xs    -- base case: right list empty
                    -- right list empty, so just return left list 
merge (x:xs) (y:ys) -- recursive case: compare heads
    | x <= y = x : merge xs (y:ys)      -- x is smaller, place x first, then merge remaining left list xs against full right list (y:ys)       
    | otherwise = y : merge (x:xs) ys   -- y is smaller, place y first, then merge full left list (x:xs) against remaining right list ys 

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