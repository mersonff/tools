# frozen_string_literal: true

FactoryBot.define do
  factory :tool do
    code { Faker::Number.number(digits: 4) }
    name { Faker::Name }
    brand { Faker::Name }
    kind { :mouse }
    observations { Faker::Lorem.paragraph(sentence_count: 2) }
    place { create(:place) }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/images/product_image.png'), 'image/png') }
  end
end
