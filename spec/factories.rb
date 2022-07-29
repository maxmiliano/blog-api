FactoryBot.define do
  factory :user do
    
  end

  factory :post do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
  end
end
