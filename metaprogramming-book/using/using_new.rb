module Kernel
  def using(resource)
    yield if block_given?
  ensure
    resource.dispose
  end
end
