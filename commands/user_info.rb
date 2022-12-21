require 'dotiw'
require './lib/bot_settings'

include DOTIW::Methods

module ApplicationCommands
  extend Discordrb::EventContainer
  extend BotSettings

  bot = get_bot

  application_command(:user).subcommand('info') do |event|
    user = event.options.empty? ? event.user : bot.user(event.options['user'].to_s)
    member = bot.member(event.server_id, user)

    now = Time.now.utc
    creation_time = user.creation_time
    creation_time_utc = creation_time.utc
    distance_time = distance_of_time_in_words(now, creation_time_utc, true)
    year_or_month = distance_time[2..7] == 'months' ? 'months' : 'years'


    join_time = member.joined_at
    join_time_utc = join_time.utc
    distance_join = distance_of_time_in_words(now, join_time_utc, true)
    result_in_words = distance_join[0..6]

    emoji = member.boosting? == false ? ':x:' : ':white_check_mark:'

    event.respond do |builder|
      builder.add_embed do |embed|
        embed.title = 'Informations about the user'
        embed.description = "#{user.name}"
        embed.timestamp = Time.now
        embed.color = rand(0..0xfffff)
        embed.thumbnail = Discordrb::Webhooks::EmbedThumbnail.new(url: user.avatar_url)
        embed.add_field(name: ':computer: Discord ID', value: [
          user.id.to_s
        ].join, inline: true)
        embed.add_field(name: ':label: Discord Tag', value: [
          "#{user.name}##{user.discriminator}"
        ].join, inline: true)
        embed.add_field(name: ':date: Account created on', value: [
          "#{creation_time_utc.strftime('%d/%m/%Y at %I:%M')} (#{distance_time[0]} #{year_or_month} ago)"
        ].join, inline: true)
      end
      builder.add_embed do |embed|
        embed.title = 'Informations about the member'
        embed.add_field(name: ':date: Joined at', value: [
          "#{join_time_utc.strftime('%d/%m/%Y at %I:%M')} (#{result_in_words} ago)"
        ].join, inline: true)
        embed.add_field(name: ':crown: Highest role', value: [
          "@#{member.highest_role.name}"
        ].join, inline: true)
        embed.add_field(name: ':eyes: Curiosities', value: [
          "#{emoji} Boosting?:rocket:"
        ].join, inline: false)
      end
    end
  end
end