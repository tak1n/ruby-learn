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
      #@target || @target = [] (Nil Guard)
    end
end

proxy = Proxy.new
puts proxy.class
# => Array
# Target Definition static in Proxy Class


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
puts obj.class
# Target Definition is dynamic via initialize param
