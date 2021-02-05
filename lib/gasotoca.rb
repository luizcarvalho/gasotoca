require 'gasotoca/version'
require 'gasotoca/error'
require 'gasotoca/parser'
require 'gasotoca/scraper'

module Gasotoca
  class << self

    def prices
      prices_in_json
    end

    def prices_in_json
      parser = Gasotoca::Parser.new(last_pdf_link)
      parser.extract_prices
      parser.prices_to_json
    end

    def last_pdf_link
      data = Scraper.new.collect_data
      data.last[:link]
    end

  end
  # Your code goes here...
end
