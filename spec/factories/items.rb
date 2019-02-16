FactoryBot.define do
    factory :item do
      title { Faker::StarWars.character }
      description { Faker::Lorem.sentence }
      done false
      todo
    end
end