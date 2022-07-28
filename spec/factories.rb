FactoryBot.define do
  factory :post do
    title { Faker::Loren.sentence }
    content { Faker::Loren.paragraph }
  end
end
