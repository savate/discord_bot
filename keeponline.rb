# Script for replit.com to keep the bot online

require 'socket'

def keeponline
    t = Thread.new do
      server = TCPServer.new 80
      loop do
        puts 'Server Online'
        client = server.accept
        client.puts "I'm now online!"
        client.close
      end
    end
end