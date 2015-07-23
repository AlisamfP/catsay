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

    @say = _.first cmd.args
    @catSpeak = cmd.cat

  run: =>
    @parseOptions()

    return @die new Error('No text specified') unless @say?
    return @catsay "meow meow meow" if @catSpeak
    @catsay @say

  catsay: (text) =>
    console.log(" /\\_/\\ ")
    console.log("( o.o )  ---#{text}")
    console.log(" m   m ")

  die: (error) =>
    if 'Error' == typeof error
      console.error colors.red error.message
    else
      console.error colors.red arguments...
    process.exit 1

new CatSay().run()
