require 'dotenv'
require 'discordrb/webhooks'

module Commands 
    extend Discordrb::Commands::CommandContainer

    Dotenv.load
    WEBHOOK_URL = ENV['WEBHOOK_URL']

    command :agostinho do |event, *question|
        answers = ['Sim', 'Meia noite te conto', 'Não']
        client = Discordrb::Webhooks::Client.new(url: WEBHOOK_URL)
        client.execute do |builder|
          builder.add_embed do |embed|
            embed.description = "#{answers.sample}"
            embed.color = rand(0..0xfffff)
          end
        end
    end
end