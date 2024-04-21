module Test.Main where

import Prelude

import Answer as Answer
import Effect (Effect)
import Effect.Class.Console (log)

main ∷ Effect Unit
main = do
  assertEqual 42 Answer.universe

--------------------------------------------------------------------------------
-- Utilities -------------------------------------------------------------------

assertEqual ∷ ∀ a. Show a ⇒ Eq a ⇒ a → a → Effect Unit
assertEqual a b =
  if a == b then log "Test passed"
  else log $ "Test failed: " <> show a <> " /= " <> show b
