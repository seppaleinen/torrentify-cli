# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'torrentify-cli'
  spec.version       = 0.3
  spec.authors       = ['david eriksson']
  spec.email         = ['davideriksson@swedenmail.com']

  spec.summary       = 'A terminal client for searching through torrent-sites'
  spec.description   = 'A terminal client for searching through torrent-sites'
  spec.homepage      = 'http://seppaleinen.github.io/torrentify-cli'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise 'RubyGems 2.0 or nwr is required to protect against public gem pushes'
  end

  spec.files         = `git ls-files`.split($OUTPUT_RECORD_SEPARATOR)
  spec.bindir        = 'bin'
  spec.executables   = ['torrentify']
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'commander', '4.4.0'
  spec.add_runtime_dependency 'torrentify', '0.5'
  spec.add_development_dependency 'simplecov', '0.11.2'
  spec.add_development_dependency 'bundler', '1.11.2'
  spec.add_development_dependency 'rake', '10.5.0'
  spec.add_development_dependency 'codeclimate-test-reporter', '0.5.0'
  spec.add_development_dependency 'coveralls', '0.8.13'
  spec.add_development_dependency 'rspec', '3.4.0'
  spec.add_development_dependency 'test-unit', '3.1.7'
  spec.add_development_dependency 'rubocop', '0.37.2'
  spec.add_development_dependency 'webmock', '1.22.6'
end
