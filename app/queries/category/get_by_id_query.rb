# frozen_string_literal: true

class Category::GetByIdQuery
  def call(id)
    Category.find_by(id: id)
  end
end
