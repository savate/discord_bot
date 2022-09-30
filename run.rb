require 'require_all'
require 'dotenv'
require_all 'lib'
require_all 'commands'

Dotenv.load
TOKEN = ENV['TOKEN']

bot = Initialize::Bot.new(TOKEN, '!')
bot.include! Commands
bot.run