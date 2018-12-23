module Project where

import Data.Text (Text)

data Unit = Unit { health :: Int
                 , attackDamage :: Int 
                 } deriving (Show, Eq)

attack :: Unit -> Int -> Unit
attack u damageTaken = Unit { attackDamage = (attackDamage u)
                            , health       = (health u - damageTaken)
                            }

p1 = Unit {attackDamage = 20, health = 10}
p2 = attack p1 10
