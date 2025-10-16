# frozen_string_literal: true

require "httparty"

module SightengineRb
  class Client
    class BaseRequest
      include HTTParty
      base_uri "https://api.sightengine.com/1.0"

      def initialize(api_user, api_secret)
        @api_user = api_user
        @api_secret = api_secret
      end

      def post(path, params = {})
        if params[:file]
          params[:media] = params.delete(:file)
          self.class.post(path, body: params.merge(api_user: @api_user, api_secret: @api_secret))
        else
          self.class.post(path, body: params.merge(api_user: @api_user, api_secret: @api_secret), headers: { "Content-Type" => "application/x-www-form-urlencoded" })
        end
      end
    end
  end
end
