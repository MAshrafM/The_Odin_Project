require "spec_helper"


module Connect
  describe Player do
    context "#intialize" do
	  
	  it "raise an exception when init with {}/empty hash" do
	    expect{player.new({})}.to raise_error
	  end
	  
	  it "doesn't raise an error when intialize with color and name" do
	    input = {name: "MAshraf"}
		expect{Player.new(input)}.to_not raise_error
	  end
	  
	end
	
	context "#token" do
	  it "retun token when none" do
	    input = {name: "MAshraf"}
		player = Player.new(input)
		expect(player.token).to eq "\u265e"
	  end
	  
	  it "return passed token" do
	    input = {name: "MAshraf", token: "\u265f"}
		player = Player.new(input)
		expect(player.token).to eq "\u265f"
	  end
	end
	
	context "#name" do
	  it "return players name" do
	    input = {name: "MAshraf"}
		player = Player.new(input)
		expect(player.name).to eq "MAshraf"
	  end
	end
	
  end
end
