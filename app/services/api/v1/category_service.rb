# frozen_string_literal: true

module Api::V1
  class CategoryService < ApplicationService
    def initialize
      @category_get_all_query = Category::GetAllQuery.new
      @category_get_by_id_query = Category::GetByIdQuery.new
    end

    def index
      @category_get_all_query.call
    end

    def show(id)
      category = @category_get_by_id_query.call(id)

      unless category
        raise NotFoundError.new(
          errors: [I18n.t('errors.messages.not_found', id: id)]
        )
      end

      category
    end
  end
end
