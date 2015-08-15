#lib spec/game_spec.rb

require "spec_helper.rb"

module MasterMind
  describe Game do
    
	let(:player){Player.new({name: "MAshraf"})}
    let(:game){Game.new(player)}
	
	context "#intialize" do
	  it "intialize with a player" do
	    expect{Game.new(player)}.to_not raise_error
	  end
	end
	
	context "#player" do
	  it "returns player" do
	    expect(game.player).to eq player
	  end
	  
	  it "return player name" do
	    expect(player.name).to eq "MAshraf"
	  end
	end
	
	context "#deck" do
	  it "it return array of four" do
	    expect(game.deck.slots).to have(4).things
	  end
	end
	
	context "#get_guess" do
	  it "get current guess" do
	    game.get_guess("4444")
		expect(game.current_guess).to eq [4,4,4,4]
	  end
	end
	
  end
end
