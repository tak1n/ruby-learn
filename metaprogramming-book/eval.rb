class MyClass
end

MyClass.instance_eval do
  def class_method
    puts 'class'
  end
end

MyClass.class_eval do
  def instance_method
    puts 'instance'
  end
end

MyClass.class_method
MyClass.new.instance_method
