FactoryBot.define do
  factory :user do
    organization_name { Faker::Company.unique.name }
    email { Faker::Internet.unique.email }
    password { 'password' }
  end
end