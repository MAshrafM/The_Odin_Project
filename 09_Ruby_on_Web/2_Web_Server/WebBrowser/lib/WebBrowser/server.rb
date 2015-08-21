# lib/WebBrowser/server.rb

module WebBrowser
  class Server
    def initialize
	  @server = TCPServer.new("127.0.0.1", 2000)
	  @website = Website.new
	end
	
	def run
	  loop do
	    client = @server.accept
		#request = WebBrowser::Request.new(client)
		request = Request.new(client)
		
		case request.method
		when "GET"
		  if request.path == "/index"
		    temp = @website.render_template(:index, request.params)
			client.puts Response200.new(temp)
		  else
		    client.puts Response404.new
		  end
		when "POST"
		  if request.path == "/register"
		    temp = @website.render_template(:thanks, request.params['odin'])
			client.puts Response200.new(temp)
		  else
		    client.puts Response404.new
		  end
		end
		client.close
	  end
	end
  end
end