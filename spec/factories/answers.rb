FactoryBot.define do
  factory :answer do
    answer { Faker::Lorem.sentence }
    feedback_id { 2 }
    association :user
    association :question
  end
end
