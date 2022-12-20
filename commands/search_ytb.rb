require 'httparty'
require 'dotenv'
require 'json'

module ApplicationCommands
  extend Discordrb::EventContainer
  extend CommandsHelpers
  i = 0
  content = nil

  application_command(:youtube) do |event|
    video_query = query_formatter(event.options['video'], i)
    content = video_query
    event.respond(content: video_query) do |_, view|
      view.row do |r|
        r.button(label: 'Back', style: :primary, custom_id: 'back_button')
        r.button(label: 'Next', style: :primary, custom_id: 'next_button')
      end
    end
  end

  button(custom_id: 'next_button') do |event|
    i+=1
    video_query = query_formatter(content, i)
    event.update_message(content: video_query)  do |_, view|
      view.row do |r|
        r.button(label: 'Back', style: :primary, custom_id: 'back_button')
        r.button(label: 'Next', style: :primary, custom_id: 'next_button')
      end
    end
  end

  button(custom_id: 'back_button') do |event|
    event.respond(content: "Unable to go back") unless i > 0
    i-=1
    video_query = query_formatter(content, i)
    event.update_message(content: video_query)  do |_, view|
      view.row do |r|
        r.button(label: 'Back', style: :primary, custom_id: 'back_button')
        r.button(label: 'Next', style: :primary, custom_id: 'next_button')
      end
    end
  end
end