# frozen_string_literal: true

class Article::GetAllQuery
  def call
    Article.includes(:category).all
  end
end
