{-# LANGUAGE
    NamedFieldPuns
  #-}

module Main where

import Prelude hiding (readFile)
import Lib (AcronymEntry (..))
import Data.Aeson (eitherDecode)
import Data.ByteString.Lazy (readFile)
import Data.Foldable (for_)
import Data.Text (unpack)
import Data.Char (toLower)
import Data.IORef (IORef, newIORef, readIORef, writeIORef, modifyIORef)
import System.Random.Shuffle (shuffleM)


main :: IO ()
main = do
  putStrLn "Type 1 for acronyms, and 2 for port numbers"
  menuChoice <- getLine
  case menuChoice of
    "1" -> acronyms
    "2" -> pure ()
    _ -> error "Not a valid menu choice."

-- | Parses the file, shuffles the deck, and runs a test over each entry in the deck.
withDeckFile :: Filename -> (IORef Int -> AcronymEntry -> IO ()) -> IO ()
withDeckFile file test = do
  scoreRef <- newIORef 0
  mJson <- eitherDecode <$> readFile file
  case mJson of
    Left e -> error e
    Right xs -> do
      deckRef <- shuffleM xs >>= newIORef

      let getNext :: IO (Maybe AcronymEntry)
          getNext = do
            deck <- readIORef deckRef
            case deck of
              [] -> pure Nothing
              next:deck' -> do
                writeIORef deckRef deck'
                pure (Just next)

      let loop :: IO ()
          loop = do
            mNext <- getNext
            case mNext of
              Nothing -> pure ()
              Just next -> do
                -- TODO re-insert skipped card
                test scoreRef next
                loop

      loop

-- | Runs a loop, testing each acronym for all entries in acronyms.json
acronyms :: IO ()
acronyms = withDeckFile "acronyms.json" testAcronym

-- | Test for an acronym entry.
testAcronym :: IORef Int -> AcronymEntry -> IO ()
testAcronym scoreRef AcronymEntry{acronymName, acronymValue} = do
    score <- readIORef scoreRef
    putStrLn $ "What does the acronym " <> show acronymName <> " stand for? Type \"skip\" to skip, \"cheat\" to cheat, score: " <> show score

    let getGuess :: IO ()
        getGuess = do
          guess <- lowercase <$> getLine
          let lowerValue = lowercase (unpack acronymValue)
          case guess of
            _ | guess == "skip" -> putStrLn "skipped..."
              | guess == "cheat" -> putStrLn $ "The answer is " <> show acronymValue
              | guess == lowerValue -> do
                  putStrLn "Correct!"
                  modifyIORef scoreRef (+ 1)
              | otherwise -> do
                  putStrLn $ "Incorrect! Words correct: " <> show (wordsCorrect guess lowerValue)
                  getGuess

    getGuess

-- | Lowercaseify a string
lowercase :: String -> String
lowercase = map toLower

-- | How many words are correct so far
wordsCorrect :: String -> String -> Int
wordsCorrect subject answer =
  let subject' = words subject
      answer' = words answer
  in  wordsCorrect' subject' answer'
  where
    wordsCorrect' (x:xs) (y:ys)
      | x == y = 1 + wordsCorrect' xs ys
      | otherwise = wordsCorrect' xs ys
    wordsCorrect' _ _ = 0
