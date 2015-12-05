{-# LANGUAGE OverloadedStrings #-}

module Network.Matrix where

import Control.Lens
import Data.ByteString
import qualified Data.Text as Text
import Network.Wreq

foo :: String
foo = "bar"

data ClientHandle = ClientHandle
                  { username :: String
                  , token    :: String
                  } deriving (Show)

login :: String -> String -> String -> IO ClientHandle
login username' password homeserver =
        pure ClientHandle
            { username = username'
            , token = "memes"
            }
