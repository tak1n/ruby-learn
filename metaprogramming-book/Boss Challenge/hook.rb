module CheckedAttributes
  # If a class includes CheckedAttributes
  # instance methods of CheckedAttributes are instance methods for the klass
  # instance methods of ClassMethods are class methods for the klass
  def self.included(klass)
    klass.extend(ClassMethods)
  end

  def say
    puts "hi"
  end

  module ClassMethods
    def attr_checked(attribute, &validation)
      define_method "#{attribute}=" do |value|
        raise 'Invalid attribute' unless validation.call(value)
        instance_variable_set("@#{attribute}", value)
      end

      define_method "#{attribute}" do
        instance_variable_get("@#{attribute}")
      end
    end
  end
end
