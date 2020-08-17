lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name = 'fhir-mongoid-models'
  spec.version = '0.0.1'
  spec.authors = %w[Andrew Bird Ashok Dongare Joseph Kotanchik Rohit Kandimalla Serhii Ilin]
  spec.email = %w[andrew.bird@semanticbits.com ashok.dongare@semanticbits.com joseph.kotanchik@semanticbits.com rohit.kandimalla@semanticbits.com serhii.ilin@semanticbits.com]

  spec.summary = 'Mongo models that correspond to the FHIR specification.'
  spec.description = 'This library contains auto generated Mongo (Mongoid) models that correspond to the FHIR specification.'
  spec.homepage = 'https://github.com/MeasureAuthoringTool/fhir-mongoid-models'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.1.4'
  spec.add_development_dependency 'mongoid', '~> 7.1'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.9.0'
  spec.add_development_dependency 'rubocop', '~> 0.52.1'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'simplecov-lcov'
end
