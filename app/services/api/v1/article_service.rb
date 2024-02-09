# frozen_string_literal: true

module Api::V1
  class ArticleService < Api::ModuleService
    def initialize
      @article_populate_service = Internal::ArticlePopulateService.new
      @article_get_all_query = Article::GetAllQuery.new
      @article_search_query = Article::SearchQuery.new
      @article_get_by_id_query = Article::GetByIdQuery.new
    end

    def index
      @article_populate_service.call unless Article.any?

      @article_get_all_query.call
    end

    def search(params)
      @article_populate_service.call unless Article.any?
      @article_search_query.call(params)
    end

    def show(id)
      article = @article_get_by_id_query.call(id)

      unless article
        raise NotFoundError.new(
          errors: [I18n.t('errors.messages.not_found', id: id)]
        )
      end

      article
    end
  end
end
