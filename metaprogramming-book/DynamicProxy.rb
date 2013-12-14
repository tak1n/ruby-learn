class Proxy
  instance_methods.each { |m| undef_method m unless m =~ /(^__|^send$|^object_id$)/ }

  def my_awesome_method
    "you just called an awesome method!"
  end

  protected
    def method_missing(name, *args, &block)
      target.send(name, *args, &block)
    end

    def target
      @target ||= []
    end
end

proxy = Proxy.new
proxy.my_awesome_method
# => "you just called an awesome method!"

puts proxy.class
# => Array


class MyDynamicProxy
  instance_methods.each { |m| undef_method m unless m =~ /(^__|^send$|^object_id$)/ }

  def initialize(target)
    @target = target
  end

  def method_missing(name, *args, &block)
    @target.send(name, *args, &block)
  end
end

obj = MyDynamicProxy.new({"first" => "first"})
puts obj.class # => "result: gnirts a"
