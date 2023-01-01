require 'discordrb'
require 'dotenv'
Dir['./lib/*.rb'].each { |file| require file }
Dir['./commands/*.rb'].each { |file| require file }

include BotSettings

bot = get_bot
bot.include! ApplicationCommands

bot.run