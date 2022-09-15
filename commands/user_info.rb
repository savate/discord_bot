require 'dotiw'

include DOTIW::Methods

class UserInfo
  def self.user_info(bot)
    bot.command(:userinfo, arg_types: [Discordrb::User]) do |event, user|
      user = event.author if user.nil?

      now = Time.now.utc
      creation_time = user.creation_time
      creation_time_utc = creation_time.utc
      distance_time = distance_of_time_in_words(now, creation_time_utc, true)
      year_or_month = distance_time[2..7] == 'months' ? 'meses' : 'anos'

      event.channel.send_embed do |embed|
        embed.title = ":monkey: #{user.name}"
        embed.timestamp = Time.now
        embed.color = rand(0..0xfffff)
        embed.thumbnail = Discordrb::Webhooks::EmbedThumbnail.new(url: user.avatar_url.to_s)
        embed.url = "https://discord.com/users/#{user.id}"
        embed.author = Discordrb::Webhooks::EmbedAuthor.new(name: "#{event.author.name}##{event.author.discriminator}",
                                                            url: "https://discord.com/users/#{event.author.id}",
                                                            icon_url: event.author.avatar_url.to_s)
        embed.add_field(name: ':computer: ID do Discord', value: [
          user.id.to_s
        ].join, inline: true)
        embed.add_field(name: ':label: Tag do Dicord', value: [
          "#{user.name}##{user.discriminator}"
        ].join, inline: true)
        embed.add_field(name: ':date: Data de Criação da Conta ', value: [
          "#{creation_time_utc.strftime('%d/%m/%Y às %I:%M')} ( há #{distance_time[0]} #{year_or_month} )"
        ].join, inline: true)
      end
    end
  end
end
