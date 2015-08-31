require_relative "./lib/cell"
require_relative "./lib/board"
require_relative "./lib/bfs"

def Knight(source, target)
  k = BFS.new(source, target)
  short = [target]
  from = k.way[target]
  while(from != source)
    short.unshift(from)
	from = k.way[from]
  end
  return short.unshift(source)
end

def show(moves)
  puts
  puts "Path from #{moves[0]} to #{moves[-1]}"
  puts "You took #{moves.length - 1} jumps!"
  puts "moves are:\n"
  moves.each do |move|
    puts "\t#{move}"
  end
end

#show(Knight([0,0],[2,1]))
#show(Knight([0,0],[3,3]))
#show(Knight([3,3],[0,0]))
show(Knight([3,3],[4,3]))
#show(Knight([0,5],[1,1]))
#show(Knight([7,0],[2,2]))
#show(Knight([5,5],[2,4]))
#show(Knight([3,3],[4,3]))
#show(Knight([0,0],[7,7]))
