require 'require_all'
require 'dotenv'
require_all 'lib'
require_all 'commands'

#Dotenv.load
#TOKEN = ENV['TOKEN']

#bot = Discordrb::Bot.new(token: TOKEN, intents: [:server_messages])
include BotSettings

bot = get_bot
bot.include! ApplicationCommands

bot.run