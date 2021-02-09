require 'gasotoca/version'
require 'gasotoca/error'
require 'gasotoca/parser'
require 'gasotoca/scraper'
require 'gasotoca/laster'
require 'gasotoca/gas_station'

module Gasotoca
  class << self
    def find(fuel, **filters)
      gas_station = GasStation.new
      gas_station.find(fuel, filters)
    end
  end
end
