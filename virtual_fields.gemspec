# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'virtual_fields/version'

Gem::Specification.new do |spec|
  spec.name          = "virtual_fields"
  spec.version       = VirtualFields::VERSION
  spec.authors       = ["Tauqeer"]
  spec.email         = ["tauqeer.ahmad2008@gmail.com"]
  spec.summary       = %q{Creates a field inside a model that allows you to store arbitrary n number of attributes against a specified field.}
  spec.description   = %q{Creates a field inside a model that allows you to store arbitrary n number of attributes against a specified field.}
  spec.homepage      = "https://github.com/tauqeerahamd/virtual_fields"
  spec.license       = "MIT"

  spec.files         = ['Gemfile',
                        'lib/virtual_fields/railtie.rb',
                        'lib/tasks/virtual_fields.rake',
                        'lib/virtual_fields/version.rb',
                        'lib/virtual_fields.rb']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
