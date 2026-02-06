# frozen_string_literal: true

require_relative "client/base_request"
require_relative "client/check_request"
require_relative "client/set_celebrity_request"
require_relative "client/text_check_request"

module SightengineRb
  class Client
    attr_reader :api_user, :api_secret

    def initialize
      @api_user = SightengineRb.config.api_user
      @api_secret = SightengineRb.config.api_secret
    end

    def check(models, image_url: nil, file: nil)
      CheckRequest.new(api_user, api_secret).post(models, image_url: image_url, file: file)
    end

    def set_celebrity(celebrity_id, image_url: nil, file: nil)
      SetCelebrityRequest.new(api_user, api_secret).post(celebrity_id, image_url: image_url, file: file)
    end

    def check_text(text, lang: "en", mode: "rules", categories: nil, opt_countries: nil, list_id: nil)
      TextCheckRequest.new(api_user, api_secret).post(
        text,
        lang: lang,
        mode: mode,
        categories: categories,
        opt_countries: opt_countries,
        list_id: list_id
      )
    end
  end
end
