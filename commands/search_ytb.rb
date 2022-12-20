require 'httparty'
require 'dotenv'
require 'json'

module ApplicationCommands
  extend Discordrb::EventContainer
  extend CommandsHelpers


  application_command(:youtube) do |event|
    video_query = query_formatter(event.options['video'])
    event.respond(content: video_query)
  end
end