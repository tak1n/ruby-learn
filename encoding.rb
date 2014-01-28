class BadString < String; end
 
original      = (0..255).to_a.pack("C*").force_encoding("UTF-8")
subclass      = BadString.new(original)
round_tripped = subclass.to_s
 
puts "encoding:       original = #{original.encoding}, subclass = #{subclass.encoding}, round_tripped = #{round_tripped.encoding}"
puts "valid_encoding? original = #{original.valid_encoding?}, subclass = #{subclass.valid_encoding?}, round_tripped = #{round_tripped.valid_encoding?}"
