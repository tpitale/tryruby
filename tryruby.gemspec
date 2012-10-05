# -*- encoding: utf-8 -*-
require File.expand_path('../lib/tryruby/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Tony Pitale"]
  gem.email         = ["tpitale@gmail.com"]
  gem.description   = %q{A gem REPL version of tryruby.org}
  gem.summary       = %q{A gem REPL version of tryruby.org}
  gem.homepage      = "http://tryruby.org"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(spec)/})
  gem.name          = "tryruby"
  gem.require_paths = ["lib"]
  gem.version       = Tryruby::VERSION
end
