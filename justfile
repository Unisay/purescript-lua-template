default:
  just --list

alias b := build

build:
  @spago build -u '-g corefn'
  @pslua --foreign-path . --ps-output output --entry Main.main --lua-output-file dist/main.lua

alias r := run

run:
  @lua -e 'package.path = package.path .. ";dist/?.lua"' dist/main.lua

alias t := test
test:
  @spago --config test.dhall build -u '-g corefn'
  @pslua --foreign-path . --ps-output output --entry Test.Main.main --lua-output-file dist/test.lua
  @lua dist/test.lua
