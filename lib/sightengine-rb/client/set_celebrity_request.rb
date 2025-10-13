# frozen_string_literal: true

module SightengineRb
  class Client
    class SetCelebrityRequest < BaseRequest
      def post(celebrity_id, image_url: nil, file: nil)
        params = { id: celebrity_id }
        params[:url] = image_url if image_url
        params[:file] = File.open(file) if file

        super("/celebrities.json", params)
      end
    end
  end
end
