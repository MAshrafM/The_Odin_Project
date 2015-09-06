require_relative "../lib/Connect"

p1 = Connect::Player.new({token: "X", name: "MAshraf" })
p2 = Connect::Player.new({ token: "O", name: "Hisho" })
players = [p1, p2]
Connect::Game.new(players).play