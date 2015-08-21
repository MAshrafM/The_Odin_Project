# lib/WebBrowser/website.rb

module WebBrowser
  class Website
    attr_accessor :template
	
	def initialize
	  @template = {
	    index: File.read("./index.html"),
		thanks: File.read("./thanks.html")
	  }
	end
	
	def render_template(temp, params)
	  txt = @template[temp]
	  unless params.empty?
	    txt.sub("<%= yield %>", params.map{|key, value| "<li>#{key}: #{value}</li>"})
	  else
		txt
	  end
	end
  end
end