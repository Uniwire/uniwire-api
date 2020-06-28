# frozen_string_literal: true

puts "\n== Creating vacancies =="

number_of_vc_before = Vacancy.count
pink "\nNumber of vacancies before the creation #{number_of_vc_before}."

all_vacancies = pick_element('vacancies')
number_vc_seed = all_vacancies.keys.size

yellow "\nCreating ...\n"

register_vacancies = [
  {
    student_residence_name: 'Rep Vegas',
    vacancies: [1]
  },
  {
    student_residence_name: 'Separados do A.g.a.c.a.i.u',
    vacancies: [2, 3]
  },
  {
    student_residence_name: 'Unidos do A.g.a.c.a.i.u',
    vacancies: [4, 5, 6]
  },
  {
    student_residence_name: 'moradia do BAJA',
    vacancies: [7]
  },
  {
    student_residence_name: 'Unidos da HARPIA',
    vacancies: [8, 9]
  },
  {
    student_residence_name: 'Bonde do CR baixo',
    vacancies: [10]
  }
]

register_vacancies.each do |register|
  student_residence = StudentResidence.find_by(name: register[:student_residence_name])

  register[:vacancies].each do |number_vacancy|
    begin
      vacancy_params = all_vacancies["vacancy_#{number_vacancy}".to_sym]
      vacancy_params[:image] = image_file('treehouse.jpg')
      student_residence.vacancies.create!(vacancy_params)

      green "Vacancy: #{number_vacancy} for #{student_residence.name} -> Created with success."
    rescue
      red "Vacancy: #{number_vacancy} for #{student_residence.name} -> Error."
    end
  end
end

number_of_vc_after = Vacancy.count
pink "\nNumber of student residences after the seed #{number_of_vc_after}.\n"

sucess_vc = number_of_vc_after - number_of_vc_before == number_vc_seed

if sucess_vc
  green " ✔ All vacancies created."
else
  red " ✖ There was a problem creating some vacancies."
end
