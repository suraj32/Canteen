FactoryBot.define do 
	factory :user, class: User do
		name	{ Faker::Name.name }
		canteen_id { Faker::Number.between(1, 10) }
		email { Faker::Internet.email }
		password { Faker::Internet.password }
	end
end