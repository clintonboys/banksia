module Banksia where

import Control.Monad (forever)
import System.Environment
import System.Exit
import Data.ByteString (readFile)
import Data.ByteString.UTF8


run :: String -> IO ()
run source = do
  putStrLn source

runFile :: String -> IO ()
runFile filename = do
  content <- Data.ByteString.readFile filename
  run (toString content)
  
runPrompt :: IO ()
runPrompt = forever $ do
  putStr "banksia> "
  line <- getLine
  run line
  
report :: Int -> String -> String -> IO ()
report line where_ message = do
  putStrLn $ show line ++ "] Error" ++ where_ ++ ": " ++ message

error :: Int -> String -> IO ()
error line message = do
  report line "" message

data HadError = HadError

  
main :: IO ()
main = do
  args <- getArgs
  if Prelude.length args > 1
    then putStrLn "Usage: banksia [script]" >> exitWith (ExitFailure 64)
    else if Prelude.length args == 1
         then runFile (head args) >> exitSuccess
         else runPrompt >> exitSuccess
  
