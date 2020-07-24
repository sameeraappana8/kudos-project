FactoryBot.define do
    factory :user do
        name { Faker::Name.name }
        organization { Faker::Company.name }
        email { Faker::Internet.email }
        password { Faker::Internet.password(min_length: 8) }
        password_confirmation { password }
    end

end