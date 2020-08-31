FactoryBot.define do
  factory :time_management do
    date { "2030-08-31" }
    time { 8000 }
    association :user
  end
end
