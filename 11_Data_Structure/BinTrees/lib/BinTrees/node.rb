# lib/node.rb

module BinTrees
  class Node
    attr_accessor :value, :right_child, :left_child
    def initialize(value)
	  @value = value
	end
  end
end