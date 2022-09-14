require 'dotenv'
require 'discordrb/webhooks'

# this command only works on my server (for now)
class WebhookAnswers
  Dotenv.load
  WEBHOOK_URL = ENV['WEBHOOK_URL']

  def self.answer(bot)
    bot.command :agostinho do |_event, *_question|
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
end
