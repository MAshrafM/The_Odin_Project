# lib/WebBrowser/response.rb

module WebBrowser
  class Response
    def initialize(status, body, content_type = "text/html")
	  @status = status
	  @headers = {
	    "Server" => "Ruby Server Test",
		"Last-Modified" => Time.new.ctime,
		"Content-Type" => content_type,
		"Content-Length" => body ? body.length : 0
	  }
	  @body = body
	end
	
	def to_s
	  head = @headers.map{|key, value| "#{key}: #{value}"}.join("\n")
	  "#{@status}\n#{head}\n\n#{@body}"
	end
	
  end
end