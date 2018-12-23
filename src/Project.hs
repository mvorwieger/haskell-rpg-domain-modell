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

{-
attack :: Unit -> Int -> Unit
attack u damageTaken = Unit { attackDamage = (attackDamage u)
                            , health       = (health u - damageTaken)
                            }

type Attacker = Unit
type Defender = Unit
battle :: Attacker -> Defender -> (Attacker, Defender)
battle u1 u2 = (attacker, defender)
    where 
        attacker = attack u1 (attackDamage u2)
        defender = attack u2 (attackDamage u1)
emptyWallet :: Money
emptyWallet = Money { unMoney = 0 }


u1 = Unit {attackDamage = 10, health = 200}
u2 = Unit {attackDamage = 20, health = 100}

p1 = Player { name = "Michel", stats = u1, money = emptyWallet }
p2 = Player { name = "Robin", stats = u2, money = emptyWallet }
-}
