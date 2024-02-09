# frozen_string_literal: true

class Category::GetAllQuery
  def call
    Category.select(:id, :name).all
  end
end

