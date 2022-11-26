require 'require_all'
require 'dotenv'
require 'discordrb'

Dotenv.load('../.env')
TOKEN = ENV['TOKEN']
bot = Discordrb::Bot.new(token: TOKEN, intents: [:server_messages])

bot.register_application_command(:invite, "Ricky's invite URL")

bot.run