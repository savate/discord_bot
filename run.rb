require 'require_all'
require 'dotenv'
require_all 'lib'
require_all 'commands'

include BotSettings

bot = get_bot
bot.include! ApplicationCommands

bot.run