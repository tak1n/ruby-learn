class CleanRoom
  def complex_calculation
    11
  end

  def do_something
    puts "Something"
  end
end

clean_room = CleanRoom.new
clean_room.instance_eval do
  if complex_calculation > 10
    do_something
  end
end

#A Clean Room is just an environment where you can evaluate your blocks and 
# it usually exposes a few useful methods that the block can call.
