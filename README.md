# Zero monad where allcomputations are the same
 This code demonstrates how algebraic structures can be encoded in types. You can't actually "embed" any information, because the structure is trivial it always erases any input. The identity element is thus used to terminate the computation immediately.
 
 ## Description
Code defines a trivial monad FreeGroupZero with a single value constructor holding (), representing the zero-generator free group where every computation yields the same result, discarding both the input and the function. All operations ignore their arguments and return the single value.

- Stability   :  experimental
- Project effect : The identity element is thus used to terminate the computation immediately.
- Why is this interesting : It demonstrates how algebraic structures can be encoded in types. You can't actually "embed" any information, because the structure is trivial. It always erases any input. In this algebra lifting any value (with pure, return, etc.) always gives you the identity element of the trivial group. This is a rare case, but it's important in category theory and algebra as the unique group with one element. The identity element in any free group is the empty word, and this is the unique element when the generating set is empty. Imagine trying to write a word with no letters available, the only "word" you can write is nothing at all. This "nothing" corresponds exactly to the identity element in the group.

- Binding strategy : The bind definition for FreeGroupZero ignores f and is not standart monad     except in the trivial sense. Lists model nondeterminism by collecting all possible results, using [] as the identity and ++ as the monoidal operation. Pattern matching on FreeGroupZero () does not extract any value, since there is only one possible value (unit).

- Useful for : Checking of the Law of Monads.Left unit law: return a >>= f ≡ f a.
              The law only holds if f a is always FreeGroupZero (), i.e., 
              if FreeGroupZero is a "zero" monad where all computations are 
              the same and contain no information, this is not standart monad instance 
              for most types. It only satisfies the laws automatically because there's only 
              one possible value..

Maintainer  :  stackenmer@hotmail.com
