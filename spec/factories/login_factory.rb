FactoryBot.define do
  factory :login do
    sequence(:name) { |n| "user#{n}" }
  end
end
