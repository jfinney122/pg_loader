# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pg_loader/version'

Gem::Specification.new do |spec|
  spec.name          = "pg_loader"
  spec.version       = PgLoader::VERSION
  spec.authors       = ["jfinney122"]
  spec.email         = ["james.finney@technekes.com"]

  spec.summary       = 'Gem for loading files into Posgresql' 
  spec.description   = 'Allow files to be stream loaded into a Posgresql table via the Active::Record connection'
  spec.homepage      = 'https://github.com/jfinney122/pg_loader'

  # # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # # delete this section to allow pushing this gem to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'activerecord'
  spec.add_runtime_dependency 'pg'

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency 'nulldb'
end
