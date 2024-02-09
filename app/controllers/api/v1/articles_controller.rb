# frozen_string_literal: true

module Api::V1
  class ArticlesController < Api::ModuleController
    before_action :set_article_service

    def index
      success_response(
        data: ArticleBlueprint.render_as_hash(@article_service.index)
      )
    end

    def search
      success_response(
        data: @article_service.search(params)
      )
    end

    def show
      success_response(
        data: ArticleBlueprint.render_as_hash(@article_service.show(params[:id]))
      )
    end

    private

    def set_article_service
      @article_service = ArticleService.new
    end

    def article_params
      params.permit(:category_id, :page, :limit, :search)
    end
  end
end
