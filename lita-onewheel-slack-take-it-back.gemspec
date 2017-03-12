Gem::Specification.new do |spec|
  spec.name          = 'lita-onewheel-slack-take-it-back'
  spec.version       = '0.0.0'
  spec.authors       = ['Andrew Kreps']
  spec.email         = ['andrew.kreps@gmail.com']
  spec.description   = 'Enables a "Take that back" feature on your slack bot.'
  spec.summary       = "Just in case your bot, you know, says something it shouldn't."
  spec.homepage      = 'https://github.com/onewheelskyward/lita-onewheel-slack-take-it-back'
  spec.license       = 'MIT'
  spec.metadata      = { 'lita_plugin_type' => 'handler' }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'lita', '~> 4'

  spec.add_development_dependency 'bundler', '~> 1.3'
  # spec.add_development_dependency 'pry-byebug', '~> 3.1'
  spec.add_development_dependency 'rake', '~> 11'
  spec.add_development_dependency 'rack-test', '~> 0.6'
  spec.add_development_dependency 'rspec', '~> 3'
  spec.add_development_dependency 'simplecov', '~> 0.13'
  spec.add_development_dependency 'coveralls', '~> 0.8'
  spec.add_development_dependency 'rest-client', '~> 1'

end
