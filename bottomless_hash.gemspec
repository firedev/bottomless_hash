# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bottomless_hash/version'

Gem::Specification.new do |spec|
  spec.name          = "bottomless_hash"
  spec.version       = BottomlessHash::VERSION
  spec.authors       = ["Nick Ostrovsky"]
  spec.email         = ["nick@firedev.com"]

  spec.summary       = %q{Ruby Hash modified to accept keys blindly}
  spec.description   = %q{Is there a way to blindly assign nested values to a
                          Ruby hash without creating each key’s hash separately? Yes, but it’s more
                          involved than you’d think.}
  spec.homepage      = "https://github.com/firedev/bottomless_hash"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 0"
end
