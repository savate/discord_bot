# frozen_string_literal: true

require 'discordrb'

module Initialize
  class Bot < Discordrb::Commands::CommandBot
    def initialize(token, prefix)
      super(token: token, prefix: prefix)
    end
  end
end
