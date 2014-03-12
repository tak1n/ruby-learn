task :travis do
  Rake::Task['floodtest:unit'].invoke
  # Rake::Task['floodtest:feature'].invoke
  # Rake::Task['floodtest:spec'].invoke
end
