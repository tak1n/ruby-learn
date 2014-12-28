class MyClass
end

# instance_eval changes current class to #MyClass and self to MyClass
MyClass.instance_eval do
  def class_method
    puts 'class'
  end
end

# class_eval changes current class to MyClass and self to MyClass
MyClass.class_eval do
  def instance_method
    puts 'instance'
  end
end

MyClass.class_method
MyClass.new.instance_method
