FactoryBot.define do
  factory :question do
    problem_statement { Faker::Lorem.sentence }
    correct_answer { Faker::Lorem.sentence }
    association :user
  end
end
