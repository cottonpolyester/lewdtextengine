lib = File.expand_path 'lib'
$: << lib unless $:.include? lib

require 'lte/version'

Gem::Specification.new do |spec|
  spec.name          = 'lte'
  spec.version       = LTE::VERSION
  spec.authors       = ['cottonpolyester']
  spec.email         = ['cottonpolyester@cock.li']

  spec.summary       = "A text game engine, designed for lewd content"
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split("\n")
  spec.bindir        = 'bin'
  spec.executables   = Dir['bin/*'].collect { |f| File.basename f }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler',  '~> 1.10'
  spec.add_development_dependency 'rake',     '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.7'

  spec.add_runtime_dependency 'gtk3', '~> 2.2'
end
