# frozen_string_literal: true

puts "\n== Creating student residences =="

number_of_sr_before = StudentResidence.count
pink "\nNumber of student residences before the creation #{number_of_sr_before}."

all_student_republics = pick_element('student_residences')
number_sr_seed = all_student_republics.keys.size

yellow "\nCreating ...\n"

all_student_republics.each_value do |student_residence|
  begin
    StudentResidence.create!(student_residence)
    green "Student Residance: #{student_residence[:name]} -> Created with success."
  rescue
    red "Student Residance: #{student_residence[:name]} -> Error."
  end
end

number_of_sr_after = StudentResidence.count
pink "\nNumber of student residences after the seed #{number_of_sr_after}.\n"

sucess_sr = number_of_sr_after - number_of_sr_before == number_sr_seed

if sucess_sr
  green " ✔ All student residances created"
else
  red " ✖ There was a problem creating some student residence."
end
