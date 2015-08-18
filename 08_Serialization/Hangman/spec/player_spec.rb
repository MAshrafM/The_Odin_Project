# spec/player_spec.rb

require "spec_helper"
module Hangman
  describe Player do
    context "#intialize" do
	  
	  it "raise an exception when init with {}/empty hash" do
	    expect{player.new({})}.to raise_error
	  end

	end

	context "#name" do
	  it "return players name" do
	    input = {name: "MAshraf"}
		player = Player.new(input)
		expect(player.name).to eq "MAshraf"
	  end
	end	
	
	context "#guess" do
	  it "return a character" do
	    input = {name: "MAshraf"}
		player = Player.new(input)
		player.stub(:gets){"c"}
		expect(player.guess).to eq "C"
	  end
	  
	  it " return Save" do
	    input = {name: "MAshraf"}
		player = Player.new(input)
		player.stub(:gets){"save"}
		expect(player.guess).to eq "SAVE"
	  end
	  
	  it "return Load" do
	    input = {name: "MAshraf"}
		player = Player.new(input)
		player.stub(:gets){"load"}
		expect(player.guess).to eq "LOAD"
	  end
	  
	  it "return Quit" do
	    input = {name: "MAshraf"}
		player = Player.new(input)
		player.stub(:gets){"quit"}
		expect(player.guess).to eq "QUIT"
	  end
	  
	  it "return Load" do
	    input = {name: "MAshraf"}
		player = Player.new(input)
		player.stub(:gets){"AAA"}
		expect(player.guess).to eq "QUIT"
	  end
	end
	
  end  
end