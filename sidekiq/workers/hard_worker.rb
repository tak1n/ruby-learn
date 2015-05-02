require 'sidekiq'

class HardWorker
  include Sidekiq::Worker

  def perform(name)
    puts name
    puts 'Doing hard work'
  end
end
