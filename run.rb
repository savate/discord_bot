require 'discordrb'
require 'dotenv'
Dir['./lib/*.rb'].each { |file| require file }
Dir['./commands/*.rb'].each { |file| require file }
load 'keeponline.rb'

include BotSettings

bot = get_bot
bot.include! ApplicationCommands

keeponline()
bot.run