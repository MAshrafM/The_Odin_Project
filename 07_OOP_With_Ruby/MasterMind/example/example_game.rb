# example/example_game.rb

require_relative "../lib/MasterMind.rb"

puts "Your name: "
name = gets.chomp
player = MasterMind::Player.new({name: name})
MasterMind::Game.new(player).play