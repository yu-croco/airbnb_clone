FactoryGirl.define do
	pass = Faker::Internet.password(8)

	factory :user do
		email		Faker::Internet.email
		password	pass
	end
end
