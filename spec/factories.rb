# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :user do
    id { 1 }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    name { Faker::Name.name }
    username { Faker::Internet.username }
  end

  factory :post do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
  end
end
