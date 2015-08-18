require_relative '../lib/Hangman.rb'

puts "Your name: "
name = gets.chomp
player = Hangman::Player.new({name: name})
Hangman::Game.new(player).play