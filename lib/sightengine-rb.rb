# frozen_string_literal: true

require_relative "sightengine-rb/version"
require_relative "sightengine-rb/client"
require_relative "sightengine-rb/config"

module SightengineRb
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
