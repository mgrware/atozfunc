
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "atozfunc/version"

Gem::Specification.new do |spec|
  spec.name          = "atozfunc"
  spec.version       = Atozfunc::VERSION
  spec.authors       = ["Gilang Ramadan"]
  spec.email         = ["mgrware@gmail.com"]

  spec.summary       = "THIS GEM FOR ATOZ APPLICATION FUNCTION"
  spec.description   = "THIS GEM FOR ATOZ APPLICATION FUNCTION"
  spec.homepage      = "http://mgrdev.com"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/mgrware"
    spec.metadata["changelog_uri"] = "https://github.com/mgrware/atozfunc/change.md"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir['lib/**/*.rb', 'lib/*.rb', 'lib/**/**/*.rb', 'app/**/**/*.rb', 'app/**/*.rb']
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
end
