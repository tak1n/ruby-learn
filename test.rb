class Object
	def eigenclass
		class << self; self; end
	end
end


class MyClass
	class << self
		def classwhoami
			puts self
			puts self.class.superclass.superclass.superclass.class
			puts self.eigenclass
			puts "\n"
		end
	end

	def instancewhoami
		puts self
		puts self.class
		puts "\n"
	end
end

obj = MyClass.new

def obj.singleton_whoami
	puts self
	puts self.class
	puts "\n"
end

obj.instancewhoami
obj.singleton_whoami
MyClass.classwhoami
