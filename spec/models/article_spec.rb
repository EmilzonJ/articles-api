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
require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'associations' do
    it { should belong_to(:category) }
  end
end
