lib = File.expand_path 'lib'
$: << lib unless $:.include? lib

require 'lte/version'

task :tag do
	system "git tag v#{LTE::VERSION}"
end

task :build do
	system "gem build lte.gemspec"
end

task :install => :build do
	system "gem install lte-#{LTE::VERSION}.gem"
end
