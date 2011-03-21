require 'rubygems'
gem     'twitter'
require 'twitter'
require 'optparse'

Twitter.configure do |config|
  config.consumer_key = 'CONSUMER_KEY' 
  config.consumer_secret = 'CONSUMER_SECRET' 
  config.oauth_token = 'OAUTH_TOKEN' 
  config.oauth_token_secret = 'OAUTH_TOKEN_SECRET'
end

OptionParser.new do |opts|
 opts.on("-t", "--text TEXT", "description") do |o|
  @text = o
  client = Twitter::Client.new
  client.direct_message_create('twitter_user', @text)
 end

 opts.on("-n", "--notify TEXT", "description") do |o|
  @text = o
  client = Twitter::Client.new
   client.update(@text)
 end
end.parse!
