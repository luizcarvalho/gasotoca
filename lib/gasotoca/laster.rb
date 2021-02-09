require_relative 'parser'
require_relative 'scraper'

module Gasotoca
  class Laster

    def initialize
      parser = Gasotoca::Parser.new(last_pdf_link)
      parser.extract_prices
      @parser = parser
    end

    def prices
      @prices ||= @parser.prices
    end

    def prices_in_json
      prices.to_json
    end

    private

    def last_pdf_link
      data = Scraper.new.collect_data
      data.first[:link]
    end

  end
end
