require 'require_all'
require 'dotenv'
require 'discordrb'

Dotenv.load('../.env')
TOKEN = ENV['TOKEN']
bot = Discordrb::Bot.new(token: TOKEN, intents: [:server_messages])

bot.register_application_command(:invite, "Ricky's invite URL")
bot.register_application_command(:calendar, 'Scripture readings')
bot.register_application_command(:ping, 'Pong!')
bot.register_application_command(:user, 'User utils') do |cmd|
  cmd.subcommand('avatar', 'Displays the profile avatar of a user') do |sub|
    sub.user('user', 'Tag a user', required: false)
  end
  cmd.subcommand('info', 'Displays the user informations') do |sub|
    sub.user('user', 'Tag a user', required: false)
  end
end

bot.run