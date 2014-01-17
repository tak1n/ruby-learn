require 'sync'

class MyHash < ::Hash
  include Sync_m

  def keys
    sync_synchronize(:SH){ super }
  end
end

h = MyHash.new
puts h.keys
