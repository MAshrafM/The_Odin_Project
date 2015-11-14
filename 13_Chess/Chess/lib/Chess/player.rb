# lib/player

module Chess

	class Player
	  attr_reader :name, :color, :moves
	  def initialize(input)
	    @name = input.fetch(:name)
		@color = input.fetch(:color)
		@moves = []
	  end
	end

end
