# frozen_string_literal: true

require 'discordrb'
require 'dotenv'
require 'require_all'
require_all 'commands'

class Wrapper
  Dotenv.load
  TOKEN = ENV['TOKEN']

  BOT = Initialize::Bot.new(TOKEN, '!')

  # command methods
  Ping.new.do_ping(BOT)
  Avatar.user_avatar(BOT)
  UserInfo.user_info(BOT)
  WebhookAnswers.answer(BOT)
end
