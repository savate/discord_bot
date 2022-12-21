require 'dotiw'

module ApplicationCommands
  extend Discordrb::EventContainer
  extend BotSettings
  include DOTIW::Methods

  bot = get_bot

  application_command(:server).subcommand('info') do |event|
    server = event.options.empty? ? event.server : bot.server(event.options['id'])

    puts event.resolved

    now = Time.now.utc
    creation_time = server.creation_time.utc
    distance_time = distance_of_time_in_words(now, creation_time, true)
    year_or_month = distance_time[2..7] == 'months' ? 'month(s)' : 'year(s)'

    event.respond do |builder|
      builder.add_embed do |embed|
        embed.title = server.name
        embed.thumbnail = Discordrb::Webhooks::EmbedThumbnail.new(url: server.icon_url.to_s)
        embed.timestamp = Time.now
        embed.add_field(name: ':computer: ID', value: [
          "#{server.id}"
        ].join, inline: true)
        embed.add_field(name: ':crown: Owner', value: [
          "@#{server.owner.username}##{server.owner.discriminator}"
        ].join, inline: true)
        embed.add_field(name: ':diamonds: Booster level', value: [
          "#{server.booster_count}"
        ].join, inline: true)
        embed.add_field(name: ':date: Created on', value: [
          "#{creation_time.strftime('%d/%m/%Y at %I:%M')} (#{distance_time[0]} #{year_or_month} ago)"
        ].join, inline: true)
      end
    end
  end
end
