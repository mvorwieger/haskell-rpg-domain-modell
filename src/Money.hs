{-# LANGUAGE GeneralizedNewtypeDeriving #-}
module Money (Money(..)) where

newtype Money = Money { unMoney :: Double } deriving (Show, Eq, Num)

