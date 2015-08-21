# lib/WebBrowser/request.rb

module WebBrowser
  class Request
    attr_accessor :method, :path, :protocol, :headers, :params
	def initialize(client)
	  @client = client
	  @method, @path, @protocol = @client.gets.split(" ")
	  @headers = {}
	  @params = {}
	  @body = ""
	  read_headers
	  read_body
	  read_params	
	end
  
	def to_s
	  header = hash_to_s(@headers)
	  params = hash_to_s(@params)
	  "#{@method} #{@path} #{@protocol}\n#{headers}\n\n#{body}\n\n#{@params}"
	end
  
	def hash_to_s(hash)
	  hash.map{|key, value| "#{key}: #{value}"}.join("\n")
	end
	  
	def read_headers
	  head = ""
	  while line = @client.gets
		break if line =~ /\r\n\r\n$/
		head << line
	  end
		
	  head.split("\n").each do |h|
		key, value = h.split(":").map{|i| i.strip}
		@headers[key] = value
	  end
	end
	  
	def read_body
	  @body = @client.read(@headers["Content-Length"].to_i)
	end
	  
	def read_params
	  if @method == "POST" && @headers["Content-Type"] == "application/json"
		@params = JSON.parse(@body)
	  elsif @method == "GET" && @path.include?("?")
		@path, @params = @path.split("?")
		params.split("&").each do |p|
		  key, value = p.split("=")
		  @params[key] = value
		end
	  end
	end
  end
end