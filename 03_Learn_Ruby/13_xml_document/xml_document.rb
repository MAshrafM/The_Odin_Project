class XmlDocument
	def initialize(indent = false)
		@indent = indent
		@level = 0
    end
	
	def method_missing(method, *args, &block)
		attr = []
		
		if args[0]
			args[0].each do |key, value|
				attr << "#{key}='#{value}'"
			end
		end
		
		if attr.size == 0
			tag = "<#{method}"
		else
			tag = "<#{method} #{attr.join(" ")}"
		end
		
		if block == nil
			if @indent
				tag += "/>\n"
			else
				tag += "/>"
			end
		else
			if @indent
				@level += 2
				tag += ">\n"
				tag += "#{' '*@level}"
				tag += yield
				@level -= 2
				tag += "#{' '*(@level)}"
				tag += "</#{method}>\n"
			else
				tag += ">"
				tag += yield
				tag += "</#{method}>"
			end
		end
		tag
	end
end