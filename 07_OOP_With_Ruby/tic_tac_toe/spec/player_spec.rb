#spec/player_spec.rb

require "spec_helper"
module TicTacToe
  describe Player do
    context "#intialize" do
	  
	  it "raise an exception when init with {}/empty hash" do
	    expect{player.new({})}.to raise_error
	  end
	  
	  it "doesn't raise an error when intialize with color and name" do
	    input = {color: "X", name: "MAshraf"}
		expect{Player.new(input)}.to_not raise_error
	  end
	  
	end
	
	context "#color" do
	  it "retun color" do
	    input = {color: "X", name: "MAshraf"}
		player = Player.new(input)
		expect(player.color).to eq "X"
	  end
	end
	
	context "#name" do
	  it "return players name" do
	    input = {color: "X", name: "MAshraf"}
		player = Player.new(input)
		expect(player.name).to eq "MAshraf"
	  end
	end
	
  end
end
