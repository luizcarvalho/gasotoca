require_relative './laster'
module Gasotoca
  class Stats
    def initialize
      @prices = Laster.new.prices
    end

    # mais baratos
    # mais baratos por bandeira
    # mais baratos por região
    # mais baratos por bandeira em cada região

  end
end

