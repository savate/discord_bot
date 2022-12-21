require 'discordrb'
require 'dotenv'
require './lib/bot_settings'
Dir['./commands/*.rb'].each { |file| require file }

include BotSettings

bot = get_bot
bot.include! ApplicationCommands

bot.run