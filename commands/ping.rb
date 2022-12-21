require 'discordrb'
module ApplicationCommands
  extend Discordrb::EventContainer

  application_command(:ping) do |event|
    event.respond(content: "Pong!")
  end
end