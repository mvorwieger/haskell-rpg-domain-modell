{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TemplateHaskell #-}

module Unit where

import Data.Text (Text)
import Control.Lens
import Money 
import Item 


data Unit = Unit { _health :: Int
                 , _attackDamage :: Int 
                 } deriving (Show, Eq)

data Player = Player { _name        :: String
                     , _stats       :: Unit
                     , _money       :: Money
                     , _inventory   :: [Item]
                     } deriving (Show, Eq)
makeLenses ''Unit
makeLenses ''Player
makeLenses ''BaseItem
makeLenses ''Item

attack :: Int -> Unit -> Unit
attack damageTaken = health -~ damageTaken 

type Attacker = Unit
type Defender = Unit
battle :: Attacker -> Defender -> (Attacker, Defender)
battle u1 u2 = (attacker, defender)
    where 
        attacker = attack (u2 ^. attackDamage) u1
        defender = attack (u1 ^. attackDamage) u2

emptyWallet :: Money
emptyWallet = Money { unMoney = 0 }

u1 = Unit {_attackDamage = 10, _health = 200}
u2 = Unit {_attackDamage = 20, _health = 100}
i1 = UselessItem { _base = BaseItem { _itemName = "Test", _price = 0 }}

p1 = Player { _name = "Michel", _stats = u1, _money = emptyWallet, _inventory = [i1]}
p2 = Player { _name = "Robin", _stats = u2, _money = emptyWallet, _inventory = []}


