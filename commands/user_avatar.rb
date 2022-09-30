module Commands
  extend Discordrb::Commands::CommandContainer

  command :useravatar, arg_types: [Discordrb::User] do |event,user|
      user = event.author if user.nil?
      event.channel.send_embed do |embed|
          embed.image = Discordrb::Webhooks::EmbedImage.new(url: user.avatar_url.to_s)
      end
  end
end