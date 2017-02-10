require 'rake/testtask'

task :default => :test

Rake::TestTask.new do |t|
  t.libs << "tests"
  t.test_files = FileList['tests/test*.rb']
  t.verbose = false
  t.warning = false
  t.options = '-p' # active minitest pride output
end
