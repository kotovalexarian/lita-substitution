# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lita/substitution/version'

Gem::Specification.new do |spec|
  spec.name          = "lita-substitution"
  spec.version       = Lita::Substitution::VERSION
  spec.authors       = ["Braiden Vasco"]
  spec.email         = ["braiden-vasco@users.noreply.github.com"]

  spec.summary       = %q{Shell-like command substitution for the Lita chat bot}
  spec.description   = %q{Shell-like command substitution for the Lita chat bot.}
  spec.homepage      = "https://github.com/braiden-vasco/lita-substitution"
  spec.license       = "MIT"

  if spec.respond_to?(:metadata)
  else
    raise "RubyGems 2.0 or newer is required."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
