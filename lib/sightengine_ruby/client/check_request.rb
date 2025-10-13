# frozen_string_literal: true

module SightengineRuby
  class Client
    class CheckRequest < BaseRequest
      def post(models, image_url)
        super("/check.json", { models: models, url: image_url })
      end
    end
  end
end
