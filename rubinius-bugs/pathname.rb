require 'pathname'

class RootPath
  def to_str
    '/'
  end
end

root1 = RootPath.new
puts root1.inspect

puts Kernel.send(:Pathname, root1) == Pathname.new('/')
