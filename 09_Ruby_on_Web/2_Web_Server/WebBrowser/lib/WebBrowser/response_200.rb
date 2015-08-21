# lib/WebBrowser/response_200.rb

module WebBrowser
  class Response200 < Response
    def initialize(body)
	  super("HTTP/1.0 200 OK", body)
	end
  end
end