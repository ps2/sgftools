# Available options:
#
# rake test - Runs all test cases.
# rake package - Runs test cases and builds packages for distribution.
# rake rdoc - Builds API documentation in doc dir.

require 'rake'
require 'rspec/core/rake_task'
require 'rake/gempackagetask'

task :default => :spec

RSpec::Core::RakeTask.new do |rspec|
  #rspec.ruby_opts="-w"
end

load(File.join(File.dirname(__FILE__), "sgftools.gemspec"))
Rake::GemPackageTask.new(SPEC) do |package|
  # do nothing: I just need a gem but this block is required
end

file "lib/sgf_tools/parser.rb" => "lib/sgf_tools/parser.y" do
  sh "racc -o lib/sgf_tools/parser.rb lib/sgf_tools/parser.y"
end

file "lib/sgf_tools/tokenizer.rb" => "lib/sgf_tools/tokenizer.rex" do
  sh "rex -o lib/sgf_tools/tokenizer.rb lib/sgf_tools/tokenizer.rex"
end

task :build => ["lib/sgf_tools/parser.rb", "lib/sgf_tools/tokenizer.rb"]

