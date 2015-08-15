# spec/player_spec.rb

require "spec_helper"

module MasterMind
  describe Player do
    
	context "#intialize" do
	  it "raises exception if empty hash" do
	    expect{Player.new({})}.to raise_error
	  end
	  
	  it "doesn't raise error if got name" do
	    input = {name: "MAshraf"}
	    expect{Player.new(input)}.to_not raise_error
	  end
	end
	
	context "#name" do
	  it "return player name" do
	    input = {name: "MAshraf"}
		player = Player.new(input)
		expect(player.name).to eq "MAshraf"
	  end
	end
  
  end
end
