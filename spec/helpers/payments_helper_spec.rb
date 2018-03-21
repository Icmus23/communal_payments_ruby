require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the PaymentsHelper. For example:
#
# describe PaymentsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe PaymentsHelper, type: :helper do
  it 'should return valid cold water cost' do
    PaymentsHelper::RATES[:cold_water] = 3
    PaymentsHelper::RATES[:water_outfall] = 2
    expect(helper.calculate_cold_water_cost(3)).to eq(15)
  end

  it 'should return valid hot water cost' do
    PaymentsHelper::RATES[:hot_water] = 3
    PaymentsHelper::RATES[:water_outfall] = 2
    expect(helper.calculate_hot_water_cost(3)).to eq(15)
  end

  it 'should return valid electricity cost' do
    PaymentsHelper::RATES[:electricity_less_100] = 0.9
    PaymentsHelper::RATES[:electricity_more_100] = 1.1

    expect(helper.calculate_electricity_cost(92)).to eq(82.8)
    expect(helper.calculate_electricity_cost(111)).to eq(102.1)
  end
end
