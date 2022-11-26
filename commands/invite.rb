module ApplicationCommands
    extend Discordrb::EventContainer

    application_command(:invite) do |event|
        event.respond(content: "#{event.bot.invite_url}")
    end
end