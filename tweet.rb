require "twitter"
require "csv"

puts "Starting Program"
# Pulls from the Twitter API & populates a .csv file

 client = Twitter::REST::Client.new do |config|
   config.consumer_key = "Paste_Your_Key_Here"
   config.consumer_secret = "Paste_Your_Key_Here"
   config.access_token = "Paste_Your_Key_Here"
   config.access_token_secret = "Paste_Your_Key_Here"
 end


 CSV.open("hailtweets.csv", "wb") do |csv|
   csv << ["Tweet", "Favorites", "User", "Tweet URL"]
   puts "Spreadsheet Created"
 	client.search("turkey bacon", :lang => "en", :result_type => "popular").take(10).collect do |status|
      puts "Twitter Authorized, Searching..."
     csv << ["#{status.text}", "#{status.favorite_count}", "@#{status.user.name}", "http://www.twitter.com/#{status.user.id}/status/#{status.id}"]
     puts "Entry Created"

 	end
 end