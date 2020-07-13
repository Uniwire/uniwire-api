# frozen_string_literal: true

puts "\n== Creating establishments =="

number_of_est_before = Establishment.count
pink "\nNumber of Establishment before the creation #{number_of_est_before}."

all_establishments = pick_element('establishments')
number_est_seed = all_establishments.keys.size

yellow "\nCreating ...\n"

all_establishments.each_value do |establishment_params|
  begin
    establishment = Establishment.new(establishment_params)
    establishment.save!

    green "Establishment id: #{establishment.id} -> Created with success."
  rescue
    red "Establishment id: #{establishment.id} -> Error."
  end
end

number_of_est_after = Establishment.count
pink "\nNumber of establishments after the seed #{number_of_est_after}.\n"

sucess_est = number_of_est_after - number_of_est_before == number_est_seed

if sucess_est 
  green " ✔ All establishments created."
else
  red " ✖ There was a problem creating some Establishment."
end
