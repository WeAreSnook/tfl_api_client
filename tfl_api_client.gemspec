# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tfl_api_client/version'

Gem::Specification.new do |spec|
  spec.name                  = 'tfl_api_client'
  spec.version               = TflApi::VERSION
  spec.author                = 'Luke Hackett'
  spec.email                 = 'Luke.Hackett@live.co.uk'
  spec.homepage              = 'https://github.com/LukeHackett/tfl_api_client'
  spec.license               = 'MIT'
  spec.platform              = Gem::Platform::RUBY
  spec.required_ruby_version = '>= 2.0'
  spec.summary               = 'Transport for London API Client'
  spec.description           = <<-eof
    This gem aims to provide a simple, programmatic ruby client that allows
    native ruby applications to seamlessly interact with the Transport for
    London's live APIs.
  eof

  spec.files                 = Dir.glob('lib/**/*.rb') + %w(LICENSE README.md CHANGELOG.md)
  spec.require_paths         = ['lib']
  spec.executables           = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files            = spec.files.grep(%r{^(test|spec|features)/})

  spec.add_development_dependency 'bundler', '~> 2.1.4'
  spec.add_development_dependency 'rake', '~> 13.0.1'
  spec.add_development_dependency 'yard', '~> 0.9.25'
  spec.add_development_dependency 'dotenv', '~> 2.7.6'

  spec.add_development_dependency 'rspec', '~> 3.10'
  spec.add_development_dependency 'fuubar', '~> 2.2'
  spec.add_development_dependency 'vcr', '~> 6.0'
  spec.add_development_dependency 'webmock', '~> 3.10'
  spec.add_development_dependency 'simplecov', '~> 0.16.1'
  spec.add_development_dependency 'coveralls', '~> 0.8.23'
end
