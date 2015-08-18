# spec/word_spec.rb

require "spec_helper"

module Hangman
  describe Word do
    context "#initialize" do
	  it "contain random word with size between 5,12" do
	    guess = Word.new
		expect(guess.word.size.between?(5,12)).to be true
	  end
	  
	  it "result size equeal to guess size" do
	    guess = Word.new
		expect(guess.result.size).to eq guess.word.size
	  end
	end
	
	context "#set_word" do
	  it "return passed word" do
	    guess = Word.new
		guess.set_word("cat")
		expect(guess.word).to eq "cat"
	  end
	end
	
	context "#Action" do 
	  guess = Word.new
	  guess.set_word("apple")
	  
	  it "take the right action by adding to result" do
	    guess.action("a")
		expect(guess.result[0]).to eq "a"
	  end
	  
	  it "take right action by adding to wronf" do
	    guess.action("k")
		expect(guess.wrong.size).to eq 1
		expect(guess.wrong[0]).to eq "k"
	  end
	  
	end
	
	context "#win" do
	  it "return true when result = word" do
	    guess = Word.new
		guess.set_word("apple")
		guess.add_result("a")
		guess.add_result("p")
		guess.add_result("l")
		guess.add_result("e")
		expect(guess.win?).to be true
	  end
	end
  
  end
end