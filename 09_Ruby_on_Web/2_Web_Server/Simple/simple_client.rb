require 'socket'

hostname = 'localhost'
port = 2000

soc = TCPSocket.open(hostname, port)

while line = soc.gets
  puts line.chop
end
soc.close