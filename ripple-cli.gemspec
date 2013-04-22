# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ripple-cli/version'

Gem::Specification.new do |gem|
  gem.name          = "ripple-cli"
  gem.version       = Ripple::VERSION
  gem.authors       = ["Matt Smith", "Ryan Rauh"]
  gem.email         = ["mtscout6@gmail.com", "rauh.ryan@gmail.com"]
  gem.description   = %q{Quickly install ripple command line tools}
  gem.summary       = %q{installs the command line tool ripple}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = ["ripple"]
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency "thor", "~> 0.14"
end
