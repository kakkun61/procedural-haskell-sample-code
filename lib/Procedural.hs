module Procedural where

import Control.Monad.Cont (callCC, ContT, runContT)
import qualified Data.Foldable
import qualified Data.Traversable

for_ :: (Foldable t, Applicative f)
     => t a -> (a -> ContT () f () -> ContT () f ()) -> f ()
for_ t f = flip runContT pure $ callCC
         $ \cc -> Data.Foldable.for_ t (flip f $ cc ())

for :: (Traversable t, Applicative f)
    => t a -> (a -> (t b -> ContT (t b) f c) -> ContT (t b) f b) -> f (t b)
for t f = flip runContT pure $ callCC
        $ \cc -> Data.Traversable.for t (flip f cc)
