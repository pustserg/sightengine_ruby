# frozen_string_literal: true

require "anyway_config"

module SightengineRb
  class Config < Anyway::Config
    config_name :sightengine
    attr_config :api_user, :api_secret
  end
end
