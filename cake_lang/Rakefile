rule '.rb' => '.y' do |t|
  sh "racc -l -o #{t.name} #{t.source}"
end

rule '.rb' => '.rl' do |t|
  sh "ragel -F1 -R #{t.source} -o #{t.name}"
end

task :parser => 'lib/cake_lang/parser.rb'
task :lexer  => 'lib/cake_lang/lexer.rb'

task :compile do
  Rake::Task[:parser].invoke
  Rake::Task[:lexer].invoke
end
