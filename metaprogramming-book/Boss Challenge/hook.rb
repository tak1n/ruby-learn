module CheckedAttributes
  def self.included(base)
    base.extend(ClassMethods)
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