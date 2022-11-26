require 'require_all'
require 'dotenv'
require_all 'lib'
require_all 'commands'
require_all 'slash_commands'

Dotenv.load
TOKEN = ENV['TOKEN']

bot = Discordrb::Bot.new(token: TOKEN, intents: [:server_messages])
bot.include! ApplicationCommands

bot.run