# frozen_string_literal: true

require "anyway_config"

module SightengineRuby
  class Config < Anyway::Config
    config_name :sightengine
    attr_config :api_user, :api_secret
  end
end
