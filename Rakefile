require 'rake'
require 'rake/testtask'
require 'bundler/gem_tasks'

desc 'Clean, test and install app'
task :default => [:test, :install]

desc 'test'
task :test => [:clean, :unitTest, :rubocop]

desc 'Remove coverage and pkg dirs before compilation'
task :clean do
  rm_rf %w(coverage pkg)
end

desc 'Run RuboCop - Tool for detecting codestyle violations'
task :rubocop do
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new
end

desc 'Run Unittests'
Rake::TestTask.new(:unitTest) do |t|
  t.libs << 'test'
  t.verbose = false
  t.test_files = FileList['test/*_test.rb', 'test/sites/*_test.rb']
end

desc 'Run codeclimate - Sends coverage info to CodeClimate when in CI'
task :codeclimate => :test do
  require 'simplecov'
  require 'codeclimate-test-reporter'
  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
      SimpleCov::Formatter::HTMLFormatter,
      CodeClimate::TestReporter::Formatter
  ]
  CodeClimate::TestReporter::Formatter.new.format(SimpleCov.result)
end

require 'coveralls/rake/task'
Coveralls::RakeTask.new
desc 'Run Coveralls - Sends coverage info to coveralls.io when in CI'
task :coveralls => [:test, 'coveralls:push'] do
  require 'simplecov'
  require 'coveralls'
  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
        SimpleCov::Formatter::HTMLFormatter,
        Coveralls::SimpleCov::Formatter
  ]
  Coveralls.wear_merged!
end
