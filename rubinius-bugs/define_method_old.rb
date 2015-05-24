class B
  def worker_loop(worker)
  end
end

class A
  def worker_loop(worker)
    orig = method(:worker_loop)
    m = B.instance_method(:worker_loop)

    require 'pry'
    binding.pry
    orig == m ? puts("same") : puts("different")
  end
end

A.new.worker_loop("worker")
