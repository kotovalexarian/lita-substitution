# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = 'lita-substitution'
  spec.version       = '0.1.1'
  spec.authors       = ['Braiden Vasco']
  spec.email         = ['braiden-vasco@users.noreply.github.com']

  spec.summary       = 'Shell-like command substitution for the Lita chat bot'
  spec.description   = 'Shell-like command substitution for the Lita chat bot.'
  spec.homepage      = 'https://github.com/braiden-vasco/lita-substitution'
  spec.license       = 'MIT'

  if spec.respond_to?(:metadata)
    spec.metadata['lita_plugin_type'] = 'handler'
  else
    fail 'RubyGems 2.0 or newer is required.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rubocop', '~> 0.31'
  spec.add_development_dependency 'rspec', '~> 3.3'
  spec.add_development_dependency 'simplecov', '~> 0.10'
  spec.add_development_dependency 'github_changelog_generator', '~> 1.6'

  spec.add_runtime_dependency 'lita', '~> 4.6'
end
