require 'lib/rstack/version'

spec = Gem::Specification.new do |s|
  
  s.name = 'rstack'  
  s.author = 'John Crepezzi'
  s.add_development_dependency('rspec')
  s.add_runtime_dependency('json')
  s.description = 'rstack is a Ruby wrapper for the Stack Exchange API'
  s.email = 'john@crepezzi.com'
  s.files = Dir['lib/**/*.rb']
  s.has_rdoc = true
  s.homepage = 'http://seejohnrun.github.com/rstack/'
  s.platform = Gem::Platform::RUBY
  s.require_paths = ['lib']
  s.summary = 'Ruby Stack Exchange API Wrapper'
  s.test_files = Dir.glob('spec/*.rb')
  s.version = RStack::VERSION
  s.rubyforge_project = "rstack"

end