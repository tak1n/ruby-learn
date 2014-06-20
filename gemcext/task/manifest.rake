desc 'Generates the MANIFEST file'
task :manifest do
  FILE_LIST = FileList.new(
    'checkum/**/*.*',
    'doc/**/*.*',
    'lib/**/*.*',
    'LICENSE.txt',
    'MANIFEST',
    '*.gemspec',
    'README.md'
  )

  files  = FILE_LIST.to_a.sort
  handle = File.open(File.expand_path('../../MANIFEST', __FILE__), 'w')

  handle.write(files.join("\n"))
  handle.close
end
