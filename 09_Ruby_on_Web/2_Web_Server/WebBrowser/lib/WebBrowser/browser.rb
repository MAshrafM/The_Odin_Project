# lib/WebBrowser/browser.rb

module WebBrowser
  class Browser
    attr_reader :get_uri, :post_uri

    def initialize
      puts "Welcome to WebBrowser Test"
      @get_uri  = URI("http://127.0.0.1:2000/index")
      @post_uri = URI("http://127.0.0.1:2000/register")
    end
  
    def run
      loop do
        response = nil
        inst
	    request_type = gets.chomp.upcase
	    if request_type == "GET"
		 response = get_methode
  	    elsif request_type == "POST"
          puts "Register for our AWESOME Site"
          print "Enter name: "
          name = gets.chomp
          print "Enter email: "
          email = gets.chomp
          params = odin_params(name, email)
          response = post_method(params)
 	    elsif request_type == "Q" || request_type == "QUIT"
          puts "Bye, Hope to see you Again!"
		  return
        else
          puts "Unknown command please follow instruction"
        end
      end
    end

    private
    def odin_params(name, email)
      { 'odin' => { 'name' => name, 'email' => email }}
    end
  
    def display_response(response)
      puts response.body
      puts "________________________________________________________"
    end

    def get_methode
      response = Net::HTTP.get_response(@get_uri)
      display_response(response)
    end

    def post_method(params)
      params = params.to_json
    
      http = Net::HTTP.new(@post_uri.host, @post_uri.port)
    
      request = Net::HTTP::Post.new(@post_uri.request_uri)
      request.body = params
    
      request["Content-Type"] = "application/json"
      request["Content-Length"] = params.length
    
      response = http.request(request)
      display_response(response)
    end
  
    def inst
      puts "Enter (get || post) as your request method"
	  puts "or (quit) to exit the browser"
    end

  end 
end