module Item (Item(..), BaseItem(..)) where

import Money 

data BaseItem = BaseItem { _itemName :: String
                         , _price :: Money
                         } deriving (Show, Eq)

data Item = OffenceItem { _base :: BaseItem, _damage :: Int }
          | DefenceItem { _base :: BaseItem, _armour :: Int }
          | UselessItem { _base :: BaseItem }
          deriving (Show, Eq)


