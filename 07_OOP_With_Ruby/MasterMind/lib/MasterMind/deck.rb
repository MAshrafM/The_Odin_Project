# lib/MasterMind/deck.rb

module MasterMind
  class Deck
    attr_accessor :slots
	def initialize(input={})
	  @slots = input.fetch(:slots, random_deck)
	end
	
	def get_slot(idx)
	  slots[idx]
	end
	
    def set_slot index, value
      get_slot(index).value = value
    end
	
	private
	def random_deck
	  Array.new(4){Slot.new}
	end
  end

end
