require 'delegate'

class A < SimpleDelegator
  def baz
    :foo
  end
end

class B
  def foo
    :baz
  end
end

p A.new(B.new).respond_to? :foo
p SimpleDelegator.new(B.new).respond_to? :foo

class Responder
  def respond_to_missing?(m, *)
    puts "Responder responding to #{m}"
  end
end

class SubResponder < Responder
end

p SubResponder.new.respond_to? :foo
p Responder.new.respond_to? :foo
