# spec/game_spec

require "spec_helper"
module Connect
  describe Game do
    p1 = Player.new(name:"MAshraf", token: "X")
	p2 = Player.new(name:"Hisho", token: "O")
	
	context "#initialize" do
	  it "select player random" do
	    allow_any_instance_of(Array).to receive(:shuffle){[p1, p2]}
		g = Game.new([p1, p2])
		expect(g.current_player.name).to eq "MAshraf"
	  end
	  
	  it "select other player" do
	    allow_any_instance_of(Array).to receive(:shuffle){[p1, p2]}
		g = Game.new([p1, p2])
		expect(g.other_player.name).to eq "Hisho"
	  end
	end
	
	context "#switch_player" do
	  it "switch current with other player" do
	    g = Game.new([p1, p2])
		other = g.other_player
		g.switch_player
		expect(g.current_player).to eq other
	  end
	  
	  it "switch other with current player" do
	    g = Game.new([p1, p2])
		curr = g.current_player
		g.switch_player
		expect(g.other_player).to eq curr
	  end
	end
  end
end
