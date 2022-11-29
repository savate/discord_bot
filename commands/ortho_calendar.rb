require 'nokogiri'
require 'open-uri'

module ApplicationCommands
    extend Discordrb::EventContainer

    doc = Nokogiri::HTML(URI.open('https://www.oca.org/readings'))
    scripture = doc.css('section ul').map { |s| s.content }
    saints = doc.css('section p').map { |s| s.content }
    date = doc.css('header h2').map { |d| d.content }

    application_command(:calendar) do |event|
        event.respond do |builder|
            builder.add_embed do |embed|
                embed.title = ':orthodox_cross: Orthodox Calendar'
                embed.description = "#{date.join}"
                embed.timestamp = Time.now
                embed.add_field(name: 'Scripture Readings', value: [
                  "#{scripture.join('\t').gsub(/\t/, '')}"
                ].join, inline: false)
                embed.add_field(name: 'Today’s commemorated feasts and saints', value: [
                  "#{saints.join}"
                ].join, inline: true)
            end
        end
    end
end