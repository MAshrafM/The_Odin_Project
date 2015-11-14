# lib Chess/piece

module Chess
  class Piece
    attr_accessor :loc, :color, :possible_moves, :token
	def initialize(input)
	  @color = input.fetch(:color).downcase
	  @loc = input.fetch(:location)
	  @possible_moves = []
	end
	
	def good_move?(board, target)
	  return false if target == @loc || friend?(board.get_location(target)) || target.nil?
	  true
	end
	
	def friend?(piece)
	  return piece.color == self.color if piece.is_a?(Piece)
	  false
	end
	
	def map_loc(loc)
	  tempx, tempy = loc.split('')
	  y = tempx.upcase.ord - 65
	  x = tempy.to_i - 1
	  [x, y]
	end
  end
end
