FactoryBot.define do
    factory :user do
      username { Faker::Name.name }
      email { Faker::Internet.email }
      password_digest 'foobar'
    end
end