# frozen_string_literal: true

puts "\n== Creating risk_areas =="

number_of_ra_before = RiskArea.count
pink "\nNumber of RiskAreas before the creation #{number_of_ra_before}."

all_risk_areas = pick_element('risk_areas')
number_ra_seed = all_risk_areas.keys.size

yellow "\nCreating ...\n"

all_risk_areas.each_value do |risk_area_params|
  begin
    risk_area = RiskArea.new(risk_area_params)
    risk_area.save!

    green "RiskArea id: #{risk_area.id} -> Created with success."
  rescue
    red "RiskArea id: #{risk_area.id} -> Error."
  end
end

number_of_ra_after = RiskArea.count
pink "\nNumber of risk_areas after the seed #{number_of_ra_after}.\n"

sucess_ra = number_of_ra_after - number_of_ra_before == number_ra_seed

if sucess_ra
  green " ✔ All risk_areas created."
else
  red " ✖ There was a problem creating some RiskArea."
end
