FactoryBot.define do
  factory :picture do
    image {  Rack::Test::UploadedFile.new(Rails.root.join('db/seed_images/treehouse.jpg'), 'image/jpeg') }
  end
end
