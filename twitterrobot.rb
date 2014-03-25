require "twitter"

puts "Starting Program"

 client = Twitter::REST::Client.new do |config|
   config.consumer_key = "Paste_Your_Key_Here"
   config.consumer_secret = "Paste_Your_Key_Here"
   config.access_token = "Paste_Your_Key_Here"
   config.access_token_secret = "Paste_Your_Key_Here"
 end

client.search("justin bieber", :lang => "en", :result_type => "popular").take(2).collect do |tweet|
	puts "Searching Twitter..."
	client.retweet(tweet.id)
	puts "Retweeted!"
	sleep 5
end