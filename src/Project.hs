{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TemplateHaskell #-}

module Project where

import Data.Text (Text)
import Control.Lens

data Unit = Unit { _health :: Int
                 , _attackDamage :: Int 
                 } deriving (Show, Eq)
makeLenses ''Unit

data Player = Player { _name :: String
                     , _stats :: Unit
                     } deriving (Show, Eq)
makeLenses ''Player

newtype Money = Money { unMoney :: Double } deriving (Show, Eq, Num)

attack :: Int -> Unit -> Unit
attack damageTaken = health +~ damageTaken 

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

p1 = Player { _name = "Michel", _stats = u1}
p2 = Player { _name = "Robin", _stats = u2}
