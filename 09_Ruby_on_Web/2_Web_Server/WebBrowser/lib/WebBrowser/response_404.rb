# lib/WebBrowser/response_404.rb

module WebBrowser
  class Response404 < Response
    def initialize
	  super("HTTP/1.0 404 Not Found", "Page Not Found!")
	end
  end
end