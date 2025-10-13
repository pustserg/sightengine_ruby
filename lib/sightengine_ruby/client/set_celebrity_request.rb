# frozen_string_literal: true

module SightengineRuby
  class Client
    class SetCelebrityRequest < BaseRequest
      def post(celebrity_id, image_url)
        super("/celebrities.json", { id: celebrity_id, url: image_url })
      end
    end
  end
end
