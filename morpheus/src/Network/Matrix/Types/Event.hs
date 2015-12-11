{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric     #-}

module Network.Matrix.Types.Event where

import Data.Aeson
import qualified Data.HashMap.Strict as Map
import Data.Text (Text)
import qualified Data.Text as Text
import GHC.Generics

data Type = PowerLevels
          | JoinRules
          | AddStateLevel
          | SendEventLevel
          | OpsLevels
          | Member
          | Invite
          | Message
          | Other Text
          deriving (Eq, Show)

data UnsignedData = UnsignedData
                  { age :: Int
                  , redacted_because :: Text
                  , transaction_id :: Text
                  } deriving(Show, Eq, Generic)

instance ToJSON UnsignedData where

instance FromJSON UnsignedData where

data Event = Event
           { type'        :: Text
           , id'          :: Text
           , roomID       :: Text
           , sender       :: Text
           , unsignedData :: UnsignedData
           , content      :: Map.HashMap Text Text
           }

instance FromJSON Event where
        parseJSON (Object v) = Event <$>
                                   v .: "type"
                               <*> v .: "id"
                               <*> v .: "room_id"
                               <*> v .: "sender"
                               <*> v .: "unsigned"
                               <*> v .: "content"
        parseJSON _          = empty

