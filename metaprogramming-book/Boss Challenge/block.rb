def add_checked_attribute(klass, attribute, &validation)
  klass.class_eval do
    # class definition -> current class = klass, self = klass
    # class_eval -> current class = klass, self = klass
    # instance_eval -> current class = singleton class of klass, self = klass
    define_method "#{attribute}=" do |value|
      raise 'Invalid attribute' unless validation.call(value)
      instance_variable_set("@#{attribute}", value)
    end

    define_method "#{attribute}" do
      instance_variable_get("@#{attribute}")
    end
  end
end
