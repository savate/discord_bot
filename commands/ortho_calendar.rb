require 'nokogiri'
require 'open-uri'

module Commands
    extend Discordrb::Commands::CommandContainer
    doc = Nokogiri::HTML(URI.open('https://www.oca.org/readings'))
    scripture = doc.css('section ul').map { |s| s.content }

    command :calendar do |event|
        event.channel.send_embed do |embed|
            embed.title = ':orthodox_cross: Orthodox Calendar'
            embed.timestamp = Time.now
            embed.add_field(name: 'Scripture Readings', value: [
                "#{scripture.join('\t').gsub(/\t/, '')}"
            ].join, inline: false)
        end
    end
end