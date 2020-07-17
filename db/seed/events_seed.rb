# frozen_string_literal: true

puts "\n== Creating events =="

number_of_ev_before = Event.count
pink "\nNumber of Event before the creation #{number_of_ev_before}."

all_events = pick_element('events')
number_ev_seed = all_events.keys.size

yellow "\nCreating ...\n"

all_events.each_value do |events_params|
  begin
    event = Event.new(events_params)
    event.save!

    green "Event id: #{event.id} -> Created with success."
  rescue
    red "Event id: #{event.id} -> Error."
  end
end

number_of_ev_after = Event.count
pink "\nNumber of events after the seed #{number_of_ev_after}.\n"

sucess_ev = number_of_ev_after - number_of_ev_before == number_ev_seed

if sucess_ev
  green " ✔ All events created."
else
  red " ✖ There was a problem creating some event."
end
