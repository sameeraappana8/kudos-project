FactoryBot.define do
    factory :message do
        kudo_message { Faker::Lorem.sentence }
    end
end