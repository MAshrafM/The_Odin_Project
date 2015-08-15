# spec/deck_spec.rb

require "spec_helper"

module MasterMind
  describe Deck do
    context "#initialize" do
	  it "has 4 things" do
	    deck = Deck.new
		expect(deck.slots).to have(4).things
	  end
	end
	
	context "#slots" do
	  it "return slots" do
	    slot = [1,2,3,4]
		deck = Deck.new(slots: slot)
		expect(deck.slots).to eq [1,2,3,4]
	  end
	end
	
	context "#get_slots" do
	  it "return slot by index" do
	    slot = [1,2,3,4]
		deck = Deck.new(slots: slot)
		expect(deck.get_slot(2)).to eq 3
	  end
	end
	
	context "#set_slot" do 
	  it "set slot valuessss" do
	    slot = [Slot.new,2,3,4]
		deck = Deck.new(slots: slot)
		deck.set_slot(0, 4)
		expect(deck.get_slot(0).value).to eq 4
	  end
	end
  
  end

end
