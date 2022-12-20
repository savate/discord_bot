module CommandsHelpers
  Dotenv.load
  YOUTUBE_KEY = ENV['YOUTUBE_KEY']

  def query_formatter(query, i)
    query_string = query.to_s
    request = HTTParty.get("https://youtube.googleapis.com/youtube/v3/search?ma
                            xResults=5&part=snippet&order=viewCount&q=#{query_string}&key=#{YOUTUBE_KEY}")
    if request.code == 200
      request_parsed = JSON.parse(request.body)
      video_id = request_parsed['items'][i]['id']['videoId']
      res = "https://www.youtube.com/watch?v=#{video_id}"
      res
    elsif request.code == 403
      "Ricky's daily quota exceeded, please try again tomorrow.\nFor more information:
https://developers.google.com/youtube/v3/getting-started#quota"
    else
      '[ERROR] TRY AGAIN'
    end
  end
end