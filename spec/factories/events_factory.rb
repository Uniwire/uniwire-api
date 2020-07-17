FactoryBot.define do
    factory :event do
      type { 'Party' }
      title { 'The Best Party' }
      description { 'Lets party!!!' }
      link { 'www.thebestparty.com' }
      date { '2020/12/12' }
      start_time { '6pm' }
      end_time { '11pm' }
    end
  end
