{-# LANGUAGE
    NamedFieldPuns
  #-}

module Lib where

import Data.Text (Text)
import Data.Aeson (FromJSON (..))
import Data.Aeson.Types (typeMismatch, Value (Array))
import Data.Vector ((!?))

data AcronymEntry = AcronymEntry
  { acronymName :: Text
  , acronymValue :: Text
  } deriving (Show, Eq)

instance FromJSON AcronymEntry where
  parseJSON val@(Array xs) = case (,) <$> xs !? 0 <*> xs !? 1 of
    Nothing -> fail $ "Not a proper entry: " <> show val
    Just (name, value) -> do
      acronymName <- parseJSON name
      acronymValue <- parseJSON value
      pure AcronymEntry{acronymName, acronymValue}
  parseJSON json = typeMismatch "AcronymEntry" json


data PortEntry = PortEntry
  { portName :: Text
  , portValue :: Int
  } deriving (Show, Eq)

instance FromJSON PortEntry where
  parseJSON val@(Array xs) = case (,) <$> xs !? 0 <*> xs !? 1 of
    Nothing -> fail $ "Not a proper entry: " <> show val
    Just (name, value) -> do
      portName <- parseJSON name
      portValue <- parseJSON value
      pure PortEntry{portName, portValue}
  parseJSON json = typeMismatch "PortEntry" json

