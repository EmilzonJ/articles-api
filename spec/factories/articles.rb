# == Schema Information
#
# Table name: articles
#
#  id           :bigint           not null, primary key
#  author       :string
#  content      :text
#  description  :string
#  published_at :datetime
#  title        :string
#  url          :string
#  url_to_image :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  category_id  :bigint           not null
#
# Indexes
#
#  index_articles_on_category_id   (category_id)
#  index_articles_on_published_at  (published_at)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
FactoryBot.define do
  factory :article do
    author { Faker::Name.name }
    content { Faker::Lorem.paragraph }
    description { Faker::Lorem.sentence }
    published_at { Time.zone.now }
    title { Faker::Lorem.sentence }
    url { Faker::Internet.url }
    url_to_image { Faker::Internet.url }
    category
  end
end
