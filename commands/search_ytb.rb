require 'httparty'
require 'dotenv'
require 'json'

Dotenv.load('./.env')
YOUTUBE_KEY = ENV['YOUTUBE_KEY']

class YoutubeCommand

    def self.format_query(query)
        query_s = query.to_s
        request = HTTParty.get("https://youtube.googleapis.com/youtube/v3/search?maxResults=1&order=viewCount&q=#{query_s}&key=#{YOUTUBE_KEY}")
        if request.code == 200
            request_parsed = JSON.parse(request.body)
            video_id = request_parsed['items'][0]['id']['videoId']
            "https://www.youtube.com/watch?v=#{video_id}"
        else
            "[ERRO] Por favor tente novamente!"
        end
    end

    def self.search(bot)
        bot.command(:youtube) do |event, *query|
           event.respond format_query(query)
        end
    end
end

