# frozen_string_literal: true

require_relative "sightengine_ruby/version"
require_relative "sightengine_ruby/client"
require_relative "sightengine_ruby/config"

module SightengineRuby
  class << self
    def config
      @config ||= Config.new
    end

    def configure
      yield config
    end
  end

  class Error < StandardError; end
end
