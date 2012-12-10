{exec} = require "child_process"

REPORTER = "min"

task "test", "run tests", ->
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

task "package", "package all files", ->
  exec "coffee --join rpnode-package.js --compile lib/*.coffee", (err, output) ->
    throw err if err
    console.log output
