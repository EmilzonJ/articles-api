# frozen_string_literal: true

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
class Article < ApplicationRecord
  belongs_to :category

  scope :search, lambda { |params|
    articles = includes(:category).all
    articles = articles.where(category_id: params[:category_id]) if params[:category_id].present?
    articles = articles.where('title ILIKE ?', "%#{params[:search]}%") if params[:search].present?
    articles
  }
end
