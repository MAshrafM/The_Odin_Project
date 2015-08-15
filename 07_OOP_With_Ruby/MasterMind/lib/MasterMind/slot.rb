# lib/MasterMind/slot.rb

module MasterMind
  class Slot
    attr_accessor :value
	def initialize (value=rand(1..5))
	  @value = value
	end
  
  end

end
