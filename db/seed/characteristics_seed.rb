# frozen_string_literal: true

puts "\n== Creating characteristics for resident students =="

number_of_ch_before = Characteristic.count
pink "\nNumber of characteristic before the creation #{number_of_ch_before}."

all_characteristics = pick_element('characteristics')
number_ch_seed = all_characteristics.keys.size

yellow "\nCreating ...\n"

all_vacancies = Vacancy.first(number_ch_seed)

all_characteristics.each_value do |characteristic_params|
  begin
    characteristic = Characteristic.new(characteristic_params)
    vacancy = all_vacancies.shift
    characteristic.vacancy = vacancy
    characteristic.save!

    green "Characteristic id: #{characteristic.id} for #{vacancy.id} -> Created with success."
  rescue
    red "Characteristic id: #{characteristic.id} for #{vacancy.id} -> Error."
  end
end

number_of_ch_after = Characteristic.count
pink "\nNumber of characteristic after the seed #{number_of_ch_after}.\n"

sucess_ch = number_of_ch_after - number_of_ch_before == number_ch_seed

if sucess_ch
  green " ✔ All characteristics created."
else
  red " ✖ There was a problem creating some characteristic."
end
