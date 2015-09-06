# spec/board_spec

require "spec_helper"
module Connect
  describe Board do
  
    context "#intiailize" do
	  board = Board.new
	  it "intiailize board with Array" do
	    board = Board.new
		expect(board.board[0]).to be_instance_of Array
	  end
	  
	  it " init with 7 col" do
		expect(board.board).to have(7).items
	  end
	  
	  it "init with 6 rows" do
		expect(board.board[0]).to have(6).items
	  end
	  
	  it "init with nil" do
		expect(board.board[0][0]).to be nil
	  end
	end
	
	context "#put_token" do
	  board = Board.new
	  it"put token in col" do
	    board.put_token(1, "X")
		expect(board.board[1].first).to eq "X"
	  end 

	  it "prevent put new token when full" do
	    6.times do
		  board.put_token(2, "v")
		end
		expect(board.put_token(2,"s")).to be false
	  end
	  
	  it "put some token and rest is nil" do
	    board.put_token(3,"s")
		expect(board.board[3][0]).to eq "s"
		expect(board.board[3][5]).to be nil
	  end
	end
	
	context "#game_over" do
	  b = Board.new
	  it "return :win if win?" do
	    allow(b).to receive(:win?){true}
		expect(b.game_over).to eq :winner
	  end
	  
	  it "return draw if draw?" do
		allow(b).to receive(:win?){false}
	    allow(b).to receive(:draw?) {true}
		expect(b.game_over).to eq :draw
	  end
	  
	  it "return false if neither" do
	    allow(b).to receive(:draw?) {false}
		expect(b.game_over).to be false
	  end
	  
	  it "draw when no moves left" do
	    b = Board.new
		(0..6).each do |i|
		  (0..5).each do |j|
		    b.put_token(i, rand(1000))		    
		  end
		end
		expect(b.game_over).to eq :draw
	  end  
	end
	
	context "#win" do 
	  it "vertical winner" do
	    b = Board.new
	    b.put_token(1, "s")
		4.times do
		  b.put_token(1,"x")
		end
		expect(b.game_over).to be :winner
	  end
	  
	  it "horizontal winner" do
	    b = Board.new
	    (1..4).each do |i|
		  b.put_token(i, "s")
		end
		expect(b.game_over).to be :winner
	  end
	  
	  it "diagonal winner" do
	    b = Board.new
		(0..3).each do |i|
		  (0..3).each do |j|
		    b.put_token(i, "x") if i == j
		    b.put_token(i, "s")
		  end
		end
		expect(b.game_over).to be :winner
	  end
	end
	
	
  end
end