method_names = public_instance_methods(true)
tests = method_names.delete_if { |method_name| method_name !~ /^test./ }

#Dynamic Dispatch with specific methods that matches a pattern -> Pattern Dispatch