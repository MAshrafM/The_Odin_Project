# spec/slot_spec.rb

require "spec_helper"

module MasterMind
  describe Slot do
    context "#intialize" do
	  it "initialize with greater than 0" do
	    100.times do
		  slot = Slot.new
		  expect(slot.value).to be > 0
		end
	  end
	  
	  it "it init. with less than 6" do
	    100.times do
		  slot = Slot.new
		  expect(slot.value).to be < 6
		end
	  end
	end
	
	context "#value" do
	  it "set a value" do
	    slot = Slot.new(5)
		expect(slot.value).to eq 5
	  end
	end
  end

end