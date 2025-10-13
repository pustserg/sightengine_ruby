# frozen_string_literal: true

module SightengineRb
  class Client
    class CheckRequest < BaseRequest
      def post(models, image_url: nil, file: nil)
        params = { models: models }
        params[:url] = image_url if image_url
        params[:file] = File.open(file) if file

        super("/check.json", params)
      end
    end
  end
end
