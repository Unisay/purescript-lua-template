module Main where

import Prelude

import Answer (universe) as Answer
import Effect (Effect)
import Effect.Console (log)

main ∷ Effect Unit
main = do

  log
    "\n\nThis is an example of a PureScript program \
    \compiled by the Purescript-Lua backend \
    \and executed by the Lua interpreter."

  log $
    "The Answer to the Ultimate Question of Life, \
    \the Universe, and Everything is: " <> show Answer.universe

