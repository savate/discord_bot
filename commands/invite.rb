module Commands
    extend Discordrb::Commands::CommandContainer

    command :invite do |event|
        event.channel.send_message event.bot.invite_url
    end
end