FactoryBot.define do
  factory :idea ,class: 'Idea' do
    sequence(:title) { |n| Faker::Company.bs + "#{n}"}
    description {Faker::Lorem.paragraph}
  end
end
