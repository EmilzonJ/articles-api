# frozen_string_literal: true

module Api::V1
  class CategoriesController < Api::ModuleController
    before_action :set_category_service

    def index
      success_response(
        data: CategoryBlueprint.render_as_hash(@category_service.index)
      )
    end

    def show
      success_response(
        data: CategoryBlueprint.render_as_hash(@category_service.show(params[:id]))
      )
    end

    private

    def set_category_service
      @category_service = CategoryService.new
    end
  end
end
