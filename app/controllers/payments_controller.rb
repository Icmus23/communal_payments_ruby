class PaymentsController < ApplicationController
  RATES = {
    cold_water: 8.28,
    hot_water:  80.62,
    water_outfall: 7.21,
    electricity_less_100: 0.9,
    electricity_more_100: 1.68,
    flat: 225.45,
    intercom: 17.90,
    heating: 991
  }

  def index
    @cold_water_amount = 3
    @hot_water_amount  = 4
    @electricity_amount = 10

    @cold_water_cost = calculate_cold_water_cost(@cold_water_amount)
    @hot_water_cost = calculate_hot_water_cost(@hot_water_amount)
    @electricity_cost = calculate_electricity_cost(@electricity_amount)
    @rates = RATES
    @total = @cold_water_cost +
      @hot_water_cost +
      @electricity_cost +
      RATES[:flat] +
      RATES[:intercom] +
      RATES[:heating]
  end

  private

  def calculate_cold_water_cost(cubic_meters)
    (RATES[:cold_water] + RATES[:water_outfall]) * cubic_meters
  end

  def calculate_hot_water_cost(cubic_meters)
    (RATES[:hot_water] + RATES[:water_outfall]) * cubic_meters
  end

  def calculate_electricity_cost(kilowatts)
    if kilowatts <= 100
      return kilowatts * RATES[:electricity_less_100]
    end

    return (kilowatts - 100) * RATES[:electricity_more_100] + 100 * RATES[:electricity_less_100]
  end
end
