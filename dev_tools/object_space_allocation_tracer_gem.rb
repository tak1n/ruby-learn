require 'allocation_tracer'
require 'pp'

def swap_elements(a)
  pivot = a.length / 2
  (0..(pivot - 1)).each do |i|
    x, y = a[i + pivot], a[i]
    x = y
    y = x
  end
end

ObjectSpace::AllocationTracer.setup(%i{path line type})

pp ObjectSpace::AllocationTracer.trace {
  N   = 10000
  arr = N.times.map{|x| (N-x).to_s }
  swap_elements(arr)
}
