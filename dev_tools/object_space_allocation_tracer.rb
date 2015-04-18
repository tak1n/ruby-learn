require 'objspace'

os = ObjectSpace
o  = nil

os.trace_object_allocations do
  class Foo
    def bar
      "baz"
    end
  end

  o = Foo.new.bar
end

printf "%s:%-2d %10s %8s\n", os.allocation_sourcefile(o), os.allocation_sourceline(o), os.allocation_method_id(o), os.allocation_class_path(o)
