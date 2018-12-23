{-# LANGUAGE TemplateHaskell #-}
module Item (Item, BaseItem) where

import Control.Lens
import Money 

data BaseItem = BaseItem { _name :: String
                         , _price :: Money
                         } deriving (Show, Eq)

data Item = OffenceItem { _base :: BaseItem, _damage :: Int }
          | DefenceItem { _base :: BaseItem, _armour :: Int }
          deriving (Show, Eq)

makeLenses ''BaseItem
makeLenses ''Item




