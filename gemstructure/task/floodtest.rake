test_runs = if ENV['TESTS']
              Integer(ENV['TESTS'])
            else
              30
            end

namespace :floodtest do
  task :unit do
    desc 'Run Unit floodtest (default 30 tests, configurable via ENV["TESTS"])'
    1.upto(test_runs) do |i|
      puts "Running test #{i} of #{test_runs}"
      exit(-1) if !system('bundle exec rake test:unit')
    end
  end

  # task :spec do
    # desc 'Run Spec floodtest (default 30 tests, configurable via ENV["TESTS"])'
    # 1.upto(test_runs) do |i|
      # puts "Running test #{i} of #{test_runs}"
      # exit(-1) if !system('bundle exec rake test:spec ')
    # end
  # end

  # task :feature do
    # desc 'Run Feature floodtest (default 30 tests, configurable via ENV["TESTS"])'
    # 1.upto(test_runs) do |i|
      # puts "Running test #{i} of #{test_runs}"
      # exit(-1) if !system('bundle exec rake test:feature')
    # end
  # end
end


