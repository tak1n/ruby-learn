require 'rubinius/profiler'

class F
  def foo(a)
    1 + a
  end

  def bar(a, b)
    foo(a) ** b
  end

  def work(a, b, n, m)
    n.times { |i| i + bar(a, b) }
    m.times { |i| foo(i) }
  end
end

p = Rubinius::Profiler::Instrumenter.new :sort => :self_seconds
p.profile {
  F.new.work 2, 3, 10, 5
}
