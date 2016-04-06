o  = Object.new
o2 = Object.new

def o.inspect
  'abc'.encode(Encoding::UTF_32BE)
end

def o2.inspect
  'def'.encode(Encoding::UTF_32LE)
end

p Encoding.default_external
p [o, o2].inspect
p [o, o2].inspect.encoding

