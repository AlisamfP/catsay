#!/usr/bin/env coffee

cmd = require 'commander'

class CatSay
  parseOptions: =>
    cmd
      .usage '[options]'
      .option '-s, --say <text>', 'text for the cat to say'
      .parse process.argv

    @say = cmd.say ? 'meow'

  run: =>
    @parseOptions()

    return @die new Error('No name specified') unless @say?
    console.log("meow #{@say} meow");


  die: (error) =>
    if 'Error' == typeof error
      console.error colors.red error.message
    else
      console.error colors.red arguments...
    process.exit 1

new CatSay().run()
