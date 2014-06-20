test_runs = if ENV['TESTS']
              Integer(ENV['TESTS'])
            else
              30
            end

namespace :floodtest do
  desc 'Run Unit floodtest (default 30 tests, configurable via ENV["TESTS"])'
  task :unit do
    1.upto(test_runs) do |i|
      puts "Running test #{i} of #{test_runs}"
      exit(-1) if !system('bundle exec rake test:unit')
    end
  end

  # desc 'Run Spec floodtest (default 30 tests, configurable via ENV["TESTS"])'
  # task :spec do
    # 1.upto(test_runs) do |i|
      # puts "Running test #{i} of #{test_runs}"
      # exit(-1) if !system('bundle exec rake test:spec ')
    # end
  # end

  # desc 'Run Feature floodtest (default 30 tests, configurable via ENV["TESTS"])'
  # task :feature do
    # 1.upto(test_runs) do |i|
      # puts "Running test #{i} of #{test_runs}"
      # exit(-1) if !system('bundle exec rake test:feature')
    # end
  # end
end


