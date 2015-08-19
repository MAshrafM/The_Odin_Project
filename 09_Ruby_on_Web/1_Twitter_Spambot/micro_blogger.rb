require 'jumpstart_auth'
require 'bitly'


class MicroBlogger
  attr_reader :client, :screen_names
  
  def initialize
    puts "Initializing MicroBlogger"
	@client = JumpstartAuth.twitter
	Bitly.use_api_version_3
	bitly = Bitly.new('hungryacademy', 'R_430e9f62250186d2612cca76eee2dbc6')
	
	@screen_names = []
	followers_list
  end
  
  def followers_list
    @screen_names = @client.followers.collect {|f| @client.user(f).screen_name }
    #@client.followers.each do |f|
	#  @screen_names << f.screen_name
	#  #sleep(3) #RequestLimitError
	#end
  end
  
  def spam_my_followers(msg)
	@screen_names.each {|target| dm(target,msg)}
  end
  
  def everyone_last_tweet
    friends = @client.friends.sort_by{|f| f.screen_name}
	friends.each do |friend|
	  timestamp = friend.status.created_at
	  time_s = timestamp.strftime("%A, %b %d")
	  
	  puts "#{friend.screen_name} said: "
	  puts friend.status.text
	  puts "created on #{time_s}"
	  puts " ------------------ "
	end
  end
  
  def tweet(msg)
    if msg.size <= 140
	  @client.update(msg)
	else
	  puts "Tweet is longer than 140"
	end
  end
  
  def dm(target, msg)
	if @screen_names.include?(target)
	  puts "Trying to send #{target} this direct message: "
	  puts msg
	  message = "d @#{target} #{msg}"
	  tweet(message)
	else
	  puts "You can't send dm to #{target}"
	end
  end
  
  def shorten(original_url)
	puts "Shortening this URL: #{original_url}"
	short_url = bitly.shorten(original_url).short_url
	puts "into : #{short_url}"
	short_url
  end
  
  def run
    puts "Welcome to the JSL Twitter Client!"
	command = ""
	while command != "q"
	  printf "Enter Command: "
	  input = gets.chomp
	  parts = input.split(" ")
	  command = parts[0]
	  case command
	  when "q" then puts "Goodbye!"
	  when "t" then tweet(parts[1..-1].join(" "))
	  when "dm" then dm(parts[1], parts[2..-1].join(" "))
	  when "spam" then spam_my_followers(parts[1..-1].join(" "))
	  when "elt" then everyone_last_tweet
	  when "s" then shorten(parts[1])
	  when "turl" then tweet(parts[1..-2].join(" ") + " " + shorten(parts[-1]))
	  else puts "Sorry, I don't know how to #{command}"
	  end
	end
  end
end

blogger = MicroBlogger.new
blogger.run
