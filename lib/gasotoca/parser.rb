# frozen_string_literal: true

require 'open-uri'
require 'pdf-reader'
require 'json'
require 'pry'

module Gasotoca
  class Parser
    attr_accessor :prices

    NOME_SIZE	= 55
    BANDEIRA_SIZE = 14
    ENDERECO_SIZE = 50
    GASOLINA_SIZE = 14
    GASOLINA_A_SIZE	= 13
    ETANOL_SIZE = 13
    DIESEL_SIZE = 14
    DIESEL_S10_SIZE	= 13
    PRICES_ATTRIBUTES =	%i[nome bandeira endereco gasolina gasolina_aditivada etanol diesel disel_s10].freeze

    # https://central3.to.gov.br/arquivo/550230/
    def initialize(url)
      @reader = PDF::Reader.new(URI.parse(url).open)
      @prices = []
      @current_region_name = nil
    end

    def extract_prices
      @reader.pages.each do |page|
        page.text.each_line do |line|
          analize_line(line)
        end
      end
      @prices
    end

    def prices_to_json
      @prices.to_json
    end

    # {a: 1, b: 11}, {a: 2, b: 12}, {a: 3, b: 13}, {a: 4, b: 14}, {a: 5, b: 15}]
    def analize_line(line)
      header = region(line)
      price_line = price_line?(line)

      if header
        @current_region_name = header
      elsif price_line
        add_prices_info_to(line)
      end
    end

    def add_prices_info_to(line)
      info_hash = extract_info(line)
      @prices << { regiao: @current_region_name }.merge(info_hash) if info_hash
    end

    def region(line)
      line[/\s{10}(Região Sul|Região Central|Taquaralto|Taquaruçu)/, 1]
    end

    def price_line?(line)
      bandeira(line)
    end

    def bandeira(line)
      bandeira_name = line[/(BAND\. BRANCA|BR|SHELL|IPIRANGA|I4IR659A4|ALE)/, 1]
      bandeira_name == 'I4IR659A4' ? 'IPIRANGA' : bandeira_name
    end

    def extract_info(line)
      line_splited = split_line(line)
      hashfy(line_splited) if line_splited[2]
    end

    def split_line(line)
      info_pattern = "(.{#{NOME_SIZE}})(.{#{BANDEIRA_SIZE}})(.{#{ENDERECO_SIZE}})"
      price_pattern = "(.{#{GASOLINA_SIZE}})(.{#{GASOLINA_A_SIZE}})(.{#{ETANOL_SIZE}})(.{#{DIESEL_SIZE}})"
      extract_pattern = Regexp.new(info_pattern + price_pattern)

      line.split(extract_pattern)
    end

    def hashfy(info_array)
      hash = {}

      PRICES_ATTRIBUTES.each_with_index do |atributo, i|
        hash[atributo] = if i < 3
                           info_array[i + 1]&.strip
                         else
                           value = info_array[i + 1].gsub(',', '.').to_f
                           value.zero? ? nil : value
                         end
      end

      hash
    end
  end
end

# parser = Gasotoca::Parser.new('https://central3.to.gov.br/arquivo/550230/')
# parser.extract_prices
# puts parser.prices_to_json
