FactoryBot.define do
  factory :canteen, class: Canteen do
    name { Faker::Restaurant.name }
    address { Faker::Address.full_address }
  end
end
