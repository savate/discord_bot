require 'require_all'
require 'dotenv'
require_all 'lib'
require_all 'commands'

Dotenv.load
TOKEN = ENV['TOKEN']

bot = Discordrb::Bot.new(token: TOKEN, intents: [:server_messages])
bot.include! ApplicationCommands

File.open('log.txt', 'w') {|f| f.write("#{bot.get_application_commands}")}
bot.run