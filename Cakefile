{exec} = require "child_process"

REPORTER = "min"

task "test", "run all tests", ->
  invoke "unit"
  invoke "package"
  invoke "functional"

task "unit", "run unit tests", ->
  exec "NODE_ENV=test 
    mocha 
    --compilers coffee:coffee-script
    --reporter #{REPORTER}
    --require coffee-script 
    --colors
    --recursive
    -R spec
  ", (err, output) ->
    throw err if err
    console.log output

task "functional", "run functional tests", ->
  exec "NODE_ENV=test 
    mocha 
    --compilers coffee:coffee-script
    --reporter #{REPORTER}
    --require coffee-script 
    --colors
    --recursive
    -R spec
    functional/*_test.coffee
  ", (err, output) ->
    throw err if err
    console.log output

task "package", "package all files", ->
  exec "coffee --join public/rpnode-package.js --compile lib/*.coffee rpnode.coffee", (err, output) ->
    throw err if err
    console.log output
