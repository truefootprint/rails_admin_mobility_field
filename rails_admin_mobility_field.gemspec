# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_admin_mobility_field/version'

Gem::Specification.new do |spec|
  spec.name          = 'rails_admin_mobility_field'
  spec.version       = RailsAdminMobilityField::VERSION
  spec.authors       = ['Andrew Volozhanin', 'Illya Havrylov']
  spec.email         = ['illya.havrylov@truefootprint.com']
  spec.description   = 'Adds tabbed interface and custom field type for mobility translations to Rails_admin'
  spec.summary       = 'Tabbed interface and custom field type for mobility translations for Rails_admin'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'rails', '>= 5.0'
  spec.add_dependency 'rails_admin', '>= 2.0'

  spec.add_dependency 'mobility', '~> 0.8'

  spec.add_development_dependency 'capybara', '~> 3.29'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec-rails', '~> 3.8'
  spec.add_development_dependency 'sqlite3'
end
