# frozen_string_literal: true

require_relative "lib/sightengine_ruby/version"

Gem::Specification.new do |spec|
  spec.name = "sightengine_ruby"
  spec.version = SightengineRuby::VERSION
  spec.authors = ["Sergey Pustovalov"]
  spec.email = ["sergey@pustovalov.me"]

  spec.summary = "A Ruby wrapper for the Sightengine API."
  spec.description = "This gem provides a convenient way to interact with the Sightengine API for content moderation."
  spec.homepage = "https://github.com/pustserg/sightengine_ruby"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/pustserg/sightengine_ruby"
  spec.metadata["changelog_uri"] = "https://github.com/pustserg/sightengine_ruby/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty", "~> 0.21"
  spec.add_dependency "anyway_config", "~> 2.4"

  spec.add_development_dependency "webmock", "~> 3.18"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
