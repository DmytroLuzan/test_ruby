FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "Jogn (#{n})" }
    sequence(:repos) { |n| ["Repo #{n}"] }
  end
end
