# frozen_string_literal: true

puts "\n== Creating commodities =="

number_of_cm_before = Commodity.count
pink "\nNumber of Commodity before the creation #{number_of_cm_before}."

all_commodities = pick_element('commodities')
number_cm_seed = all_commodities.keys.size

yellow "\nCreating ...\n"

register_commodities = [
  {
    vacancy_description: 'Melhor descrição para vaga 2.',
    commodities: [1]
  },
  {
    vacancy_description: 'Melhor descrição para vaga 4.',
    commodities: [2, 3]
  },
  {
    vacancy_description: 'Melhor descrição para vaga 6.',
    commodities: [4]
  },
  {
    vacancy_description: 'Melhor descrição para vaga 8.',
    commodities: [5]
  },
]

register_commodities.each do |register|
  register[:commodities].each do |number_commodity|
    begin
      vacancy = Vacancy.find_by(description: register[:vacancy_description])
      commodity = all_commodities["commodity_#{number_commodity}".to_sym]
      vacancy.commodities.create!(commodity)

      green "Commodity: #{commodity[:name]} for vacancy_id: #{vacancy.id} -> Created with success."
    rescue
      red "Commodity: #{commodity[:name]} for vacancy_id: #{vacancy.id} -> Error."
    end
  end
end

number_of_cm_after = Commodity.count
pink "\nNumber of commodities after the seed #{number_of_cm_after}.\n"

sucess_cm = number_of_cm_after - number_of_cm_before == number_cm_seed

if sucess_cm
  green " ✔ All commodities created."
else
  red " ✖ There was a problem creating some commodity."
end
