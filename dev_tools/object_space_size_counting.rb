require 'objspace'

Metadata = Struct.new(:class, :sourcefile, :sourceline, :class_path, :method_id, :memsize)
objects  = []
result   = {}

def walk_objects(result)
  ObjectSpace.each_object do |o|
    result[o.object_id] = Metadata.new(
      ObjectSpace.allocation_class_path(o),
      ObjectSpace.allocation_sourcefile(o),
      ObjectSpace.allocation_sourceline(o),
      ObjectSpace.allocation_class_path(o),
      ObjectSpace.allocation_method_id(o),
      ObjectSpace.memsize_of(o)
    )
  end
end


class Foo
  def bar
    "baz"
  end
end

class Bar
  def foo
    "bazsss"
  end
end

ObjectSpace.trace_object_allocations do
  a = Foo.new.bar
  b = Bar.new.foo
  walk_objects(result)
end

result.to_a.sort {|a, b| b[1].memsize <=> a[1].memsize }.to_h.each do |object_id, s|
  next if s.class_path.nil?

  printf "%s:%-2d %5s#%s %d\n", s.sourcefile, s.sourceline, s.class_path, s.method_id, s.memsize
end
