task :default do
  Rake::Task['test:unit'].invoke
  # Rake::Task['test:spec'].invoke
  # Rake::Task['test:feature'].invoke
end
