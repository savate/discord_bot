require 'dotiw'

include DOTIW::Methods

class ServerInfo
  def self.server_info(bot)
    bot.command(:serverinfo) do |event|
      now = Time.now.utc
      creation_time = event.server.creation_time.utc
      distance_time = distance_of_time_in_words(now, creation_time, true)
      year_or_month = distance_time[2..7] == 'months' ? 'meses' : 'anos'

      event.channel.send_embed do |embed|
        embed.title = ":tent: #{event.server.name}"
        embed.thumbnail = Discordrb::Webhooks::EmbedThumbnail.new(url: event.server.icon_url.to_s)
        embed.author = Discordrb::Webhooks::EmbedAuthor.new(name: "#{event.author.name}##{event.author.discriminator}",
                                                            url: "https://discord.com/users/#{event.author.id}",
                                                            icon_url: event.author.avatar_url.to_s)
        embed.timestamp = Time.now
        embed.add_field(name: ':computer: ID', value: [
          "#{event.server.id}"
        ].join, inline: true)
        embed.add_field(name: ':crown: Dono', value: [
          "#{event.server.owner.username}##{event.server.owner.discriminator}"
        ].join, inline: true)
        embed.add_field(name: ':busts_in_silhouette: Membros', value: [
          ":100: Total: #{event.server.member_count}\n"
        ].join, inline: true)
        embed.add_field(name: ":speech_balloon: Canais(#{event.server.text_channels.count + event.server.voice_channels.count})", value: [
          ":pencil: Texto: #{event.server.text_channels.count}\n",
          ":speaking_head: Voz: #{event.server.voice_channels.count}"
        ].join, inline: true)
        embed.add_field(name: ':diamonds: Booster level', value: [
          "#{event.server.booster_count}"
        ].join, inline: true)
        embed.add_field(name: ':date: Criado em', value: [
          "#{creation_time.strftime('%d/%m/%Y às %I:%M')} (há #{distance_time[0]} #{year_or_month})"
        ].join, inline: true)
      end
    end
  end
end
