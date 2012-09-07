# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'configus/version'

Gem::Specification.new do |gem|
  gem.name          = "configus"
  gem.version       = Configus::VERSION
  gem.authors       = ["Igor Kuznetsov", "Kirill Andreev"]
  gem.email         = ["igkuznetsov@gmail.com", "hindmost.one@gmail.com"]
  gem.description   = %q{Simple configuration builder}
  gem.summary       = %q{Builds configuration}
  gem.homepage      = "http://www.example.com"

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'active_support'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
