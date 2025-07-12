--TrivialMonadWithUnitType.hs
-----------------------------------------------
{-# LANGUAGE GADTs #-}

module TrivialMonadWithUnitType where

import Control.Monad (ap)

newtype FreeGroupZero a = FreeGroupZero () --FreeGroupZero is isomorphic to unit type:

instance Functor FreeGroupZero where
  fmap _ _ = FreeGroupZero ()  --This functor "forgets" everything. No matter what function or value you provide

instance Applicative FreeGroupZero where
  pure _ = FreeGroupZero ()    --No matter what value you try to "lift," you always get FreeGroupZero ().
  _ <*> _ = FreeGroupZero ()   --Applying any function in the context of FreeGroupZero to any value yields FreeGroupZero ().

instance Monad FreeGroupZero where
  return = pure                --Identity Element. The 'return' has nothing to do with the return keyword
  (>>=) _ _ = FreeGroupZero () --The input function argument is ignored.

class Monad g => Group g where --Defines a typeclass for groups, requiring a binary operation (gop), 
  gop :: g a -> g a ->  g a    --identity (gid), and inverse (ginverse), all in a monadic context.
  gid :: g a    
  ginverse :: g a -> g a

instance Group [] where
  gop = (++)                   --For lists, group operation is concatenation.
  gid = []                     --For lists, the identity is the empty list.
  ginverse = reverse           --The inverse is reversing the list (not a group in the strict algebraic sense)
  
instance Group FreeGroupZero where
  gop _ _ = FreeGroupZero ()   --The group operation always yields the only possible value.
  gid = FreeGroupZero ()       --Identity is the only value.
  ginverse _ = FreeGroupZero ()--Inverse is the only value.

data Path a = TrivialPath      --Defines a type Path with only one value, TrivialPath.
