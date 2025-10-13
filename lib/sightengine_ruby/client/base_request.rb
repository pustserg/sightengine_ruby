# frozen_string_literal: true

require "httparty"

module SightengineRuby
  class Client
    class BaseRequest
      include HTTParty
      base_uri "https://api.sightengine.com/1.0"

      def initialize(api_user, api_secret)
        @api_user = api_user
        @api_secret = api_secret
      end

      def post(path, params = {})
        self.class.post(path, query: params.merge(api_user: @api_user, api_secret: @api_secret))
      end
    end
  end
end
