namespace :test do
  Rake::TestTask.new(:unit) do |t|
    t.libs << "test" << "bin" << "ext" << "controllers" << "helpers" << "models"
    t.test_files = FileList['test/**/*_test.rb']
    t.verbose = true
  end

  # Rake::TestTask.new(:spec) do |t|
    # t.libs << "spec" << "bin" << "ext" << "controllers" << "helpers" << "models"
    # t.test_files = FileList['spec/**/*_spec.rb']
    # t.verbose = true
  # end
end


