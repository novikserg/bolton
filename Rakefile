require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new do |t|
  t.libs << "test"
  t.pattern = "test/test_*.rb"
end

namespace :test do
  task :coverage do
    ENV["COVERAGE"] = "true"
    Rake::Task["test"].invoke
  end
end

task default: :test
