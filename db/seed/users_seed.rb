# frozen_string_literal: true

puts "\n== Creating users =="

number_of_usr_before = User.count
pink "\nNumber of users before the creation #{number_of_usr_before}."

all_users = pick_element('users')
number_usr_seed = all_users.keys.size

yellow "\nCreating ...\n"

all_users.each_value do |user|
  begin
    user = User.new(user)
    if user.valid?
      green "User: #{user[:name]} -> Created with success." if user.save
    else
      red user.errors.messages
    end
  rescue
    red "User: #{user[:name]} -> Error."
  end
end

number_of_usr_after = User.count
pink "\nNumber of users after the seed #{number_of_usr_after}.\n"

sucess_usr = number_of_usr_after - number_of_usr_before == number_usr_seed

if sucess_usr
  green " ✔ All users created"
else
  red " ✖ There was a problem creating some user."
end
