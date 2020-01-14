FactoryBot.define do
  factory :post do
    author { Faker::Name.first_name }
    message { Faker::Lorem.paragraph }
    discussion_id nil
  end
end
