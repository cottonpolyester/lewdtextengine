lib = File.expand_path 'lib'
$: << lib unless $:.include? lib

require 'rake/testtask'
require 'lte/version'

Rake::TestTask.new do |t|
	t.test_files = FileList['test/*_test.rb']
	t.verbose = true
end

task :run do
	system 'ruby -Ilib bin/lte'
end

task :tag do
	system "git tag v#{LTE::VERSION}"
end

task :version do
	puts LTE::VERSION
end

task :major_bump do
	File.open('lib/lte/version.rb', 'w') do |file|
		file.puts "module LTE"
		file.puts "	VERSION_MAJOR = #{LTE::VERSION_MAJOR + 1}"
		file.puts "	VERSION_MINOR = #{0}"
		file.puts "	VERSION_DEBUG = #{0}"
		file.puts '	VERSION = "#{VERSION_MAJOR}.#{VERSION_MINOR}.#{VERSION_DEBUG}"'
		file.puts "end"
	end
end

task :minor_bump do
	File.open('lib/lte/version.rb', 'w') do |file|
		file.puts "module LTE"
		file.puts "	VERSION_MAJOR = #{LTE::VERSION_MAJOR}"
		file.puts "	VERSION_MINOR = #{LTE::VERSION_MINOR + 1}"
		file.puts "	VERSION_DEBUG = #{0}"
		file.puts '	VERSION = "#{VERSION_MAJOR}.#{VERSION_MINOR}.#{VERSION_DEBUG}"'
		file.puts "end"
	end
end

task :bump do
	File.open('lib/lte/version.rb', 'w') do |file|
		file.puts "module LTE"
		file.puts "	VERSION_MAJOR = #{LTE::VERSION_MAJOR}"
		file.puts "	VERSION_MINOR = #{LTE::VERSION_MINOR}"
		file.puts "	VERSION_DEBUG = #{LTE::VERSION_DEBUG + 1}"
		file.puts '	VERSION = "#{VERSION_MAJOR}.#{VERSION_MINOR}.#{VERSION_DEBUG}"'
		file.puts "end"
	end
end

task :build do
	system "gem build lte.gemspec"
end

task :install => :build do
	system "gem install lte-#{LTE::VERSION}.gem"
end
