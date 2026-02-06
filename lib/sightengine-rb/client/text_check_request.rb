# frozen_string_literal: true

module SightengineRb
  class Client
    class TextCheckRequest < BaseRequest
      DEFAULT_CATEGORIES = %w[
        profanity personal link drug weapon spam
        content-trade money-transaction extremism
        violence self-harm medical
      ].freeze

      def post(text, lang: "en", mode: "rules", categories: nil, opt_countries: nil, list_id: nil)
        params = {
          text: text,
          lang: lang,
          mode: mode,
          categories: (categories || DEFAULT_CATEGORIES).join(",")
        }
        params[:opt_countries] = opt_countries.join(",") if opt_countries
        params[:list] = list_id if list_id

        super("/text/check.json", params)
      end
    end
  end
end
