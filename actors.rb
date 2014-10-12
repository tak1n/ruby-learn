require 'rubinius/actor'

pong = nil

ping = Rubinius::Actor.spawn do
  loop do
    count = Rubinius::Actor.receive
    # puts count
    pong << (count + 1)
  end
end

pong = Rubinius::Actor.spawn do
  loop do
    count = Rubinius::Actor.receive
    test = mymethod
    puts test
    # puts count
    ping << (count + 1)
  end
end

ping << 1
sleep 1
