class Test
  def foo
    puts "No Exception!"
  end
end

begin
  t.foo if t = Test.new
rescue Exception => e
  STDERR.puts "Exception raised! ``#{e.class}: #{e}''"
  exit 1
end

def get_foo
  Test.new
end

def test
  return foo.foo if foo = get_foo
end

test

exit 0
