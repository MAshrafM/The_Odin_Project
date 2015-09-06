# lib/player

module Connect

  class Player
    attr_reader :name, :token
	
	def initialize(input)
	  @name = input.fetch(:name)
	  @token = input.fetch(:token, "\u265e")
	end
  end
  
end
