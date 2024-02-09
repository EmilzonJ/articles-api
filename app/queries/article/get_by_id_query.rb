# frozen_string_literal: true

class Article::GetByIdQuery
  def call(id)
    Article.find_by(id: id)
  end
end
