#!/usr/bin/env coffee
_ = require 'lodash'
cmd = require 'commander'
colors = require 'colors'

class CatSay
  parseOptions: =>
    cmd
      .usage '[options]'
      .option '-c, --cat', 'have the cat talk in its native language'
      .parse process.argv

    @say = cmd.args
    if cmd.cat
      @say = _.map @say, (word) ->
        return "Meow"
    @say = @say.join " "

  run: =>
    @parseOptions()

    return @die new Error('No text specified') unless @say?

    console.log(" /\\_/\\ ")
    console.log("( o.o )  ---#{@say}")
    console.log(" m   m ")

  die: (error) =>
    if 'Error' == typeof error
      console.error colors.red error.message
    else
      console.error colors.red arguments...
    process.exit 1

new CatSay().run()
