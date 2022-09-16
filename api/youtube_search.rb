require 'httparty'
require 'dotenv'
require 'json'

Dotenv.load('../.env')
YOUTUBE_KEY = ENV['YOUTUBE_KEY']

class YoutubeSearch
  def self.search(query)
    request = HTTParty.get("https://youtube.googleapis.com/youtube/v3/search?maxResults=1&q=#{query}&key=#{YOUTUBE_KEY}")

    if request.code == 200
      request_parsed = JSON.parse(request.body)
      video_id = request_parsed['items'][0]['id']['videoId']
      p video_id
    else
      p 'Error'
    end
  end
end