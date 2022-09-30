module Commands
  extend Discordrb::Commands::CommandContainer

  command :ping do |event|
      event.respond 'pong'
  end
end