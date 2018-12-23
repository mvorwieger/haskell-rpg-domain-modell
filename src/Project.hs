module Project where

import Data.Text (Text)

data Unit = Unit { health :: Int
                 , attackDamage :: Int 
                 } deriving (Show, Eq)

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

p1 = Unit {attackDamage = 10, health = 200}
p2 = Unit {attackDamage = 20, health = 100}
