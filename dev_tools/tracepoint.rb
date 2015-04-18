tracepoint = TracePoint.new do |tp|
  printf "%8s %s:%-2d %10s %8s\n", tp.event, tp.path, tp.lineno, tp.method_id, tp.defined_class
end

tracepoint.enable do
  class Foo
    def bar
      "baz"
    end
  end

  Foo.new.bar
end

Foo.new
