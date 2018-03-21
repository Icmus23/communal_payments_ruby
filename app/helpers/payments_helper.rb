module PaymentsHelper
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
