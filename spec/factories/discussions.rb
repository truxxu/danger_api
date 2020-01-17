FactoryBot.define do
  factory :discussion do
    author { Faker::Name.first_name }
    title { Faker::Lorem.sentence(word_count: 3) }
    message { Faker::Lorem.paragraph }
    topic_id { nil }
  end
end
