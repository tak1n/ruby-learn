class AnonymousModuleIncludedTwiceBase
    def self.whatever
      mod = Module.new do
        def a(array)
          array << "anon"
          super
        end
      end

      include mod
    end

    def a(array)
      array << "non-anon"
    end
  end

class AnonymousModuleIncludedTwice < AnonymousModuleIncludedTwiceBase
  whatever
end

test = AnonymousModuleIncludedTwice.new
p test.class.ancestors
p test.a([])

# describe AnonymousModuleIncludedTwice do
  # it 'invokes methods from a chain of anonymous modules' do
    # expect(AnonymousModuleIncludedTwice.new.a([])).to eq(["anon", "anon", "non-anon"])
  # end
# end
