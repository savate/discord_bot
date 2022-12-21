require 'discordrb'
require 'dotenv'
module BotSettings
  Dotenv.load
  TOKEN = ENV['TOKEN']
  def get_bot
    bot = Discordrb::Bot.new(token: TOKEN, intents: [:server_messages])
    bot
  end
end