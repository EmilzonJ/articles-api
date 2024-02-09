# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :category do
    name { Faker::Lorem.word }

    trait :with_articles do
      after(:create) do |category|
        create_list(:article, 3, category: category)
      end
    end
  end
end
