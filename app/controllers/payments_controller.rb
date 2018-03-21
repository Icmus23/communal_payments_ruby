class PaymentsController < ApplicationController
  include PaymentsHelper

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
end
