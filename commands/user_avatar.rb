require 'dotenv'

module ApplicationCommands
  extend Discordrb::EventContainer

  Dotenv.load('../.env')
  TOKEN = ENV['TOKEN']
  bot = Discordrb::Bot.new(token: TOKEN, intents: [:server_messages])

  application_command(:user).subcommand('avatar') do |event|
    user = event.options.empty? ? event.user : bot.user(event.options['user'].to_s)
    url = "#{user.avatar_url}?size=1024"

    event.respond do |builder|
      builder.add_embed do |embed|
        embed.title = ":frame_photo: #{user.name}"
        embed.image = Discordrb::Webhooks::EmbedImage.new(url: url)
      end
    end
  end
  end
1054241601242800189