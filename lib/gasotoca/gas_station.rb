require 'daru'
require_relative './laster'

module Gasotoca
  class GasStation
    def initialize
      @data_frame = Daru::DataFrame.new(Gasotoca::Laster.new.prices)
    end

    def find(fuel, **filters)
      filtered = @data_frame.sort([fuel]).filter_rows { |row| not_nil(row, fuel) && filters_for(row, filters) }

      if filtered.size.zero?
        []
      else
        filtered.to_a[0][0..5]
      end
    end

    def filters_for(row, filters)
      return true unless filters

      assert = true
      filters.each_pair do |attribute, value|
        assert &&= row[attribute] == value
      end

      assert
    end

    def not_nil(row, fuel)
      !row[fuel].nil?
    end
  end
end

# GasStation = Gasotoca::GasStation.new
# puts GasStation.find(:gasolina, bandeira: 'BR', regiao: 'Região Sul')
