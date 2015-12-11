{-# LANGUAGE OverloadedStrings #-}

import Network.Matrix
import Test.Hspec (Spec, hspec, describe, it, shouldSatisfy, shouldNotSatisfy, shouldBe)
import System.Environment (getEnv)
import qualified Data.Text as Text

spec :: Spec
spec =
        describe "Matrix client" $ do
            it "should let you log into an account" $ do
                username'   <- getEnv "MATRIX_USER"
                password'   <- getEnv "MATRIX_PASSWORD"
                homeserver' <- getEnv "MATRIX_HOMESERVER"
                c <- login (Text.pack username') (Text.pack password') (Text.pack homeserver')

                username c `shouldBe` Text.pack username'
            it "has function foo" $
                foo `shouldBe` "bar"

main :: IO ()
main = hspec spec
