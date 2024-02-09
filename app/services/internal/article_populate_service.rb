# frozen_string_literal: true

class Internal::ArticlePopulateService < ApplicationService
  def initialize
    @news_api_service = External::NewsApiService.new
    @category_get_all_query = Category::GetAllQuery.new
  end

  def call
    categories = @category_get_all_query.call

    categories.each do |category|
      response = @news_api_service.get_top_headlines(category: category.name)
      next unless response[:success]

      articles = External::ApiArticleBlueprint.render_as_hash(response[:body][:articles])

      save_set_of_articles(articles, category.id)
    end
  end

  private

  def article_valid?(article)
    article[:author].present? &&
      article[:content].present? &&
      article[:description].present? &&
      article[:published_at].present? &&
      article[:title].present? &&
      article[:url].present? &&
      article[:url_to_image].present?
  end

  def save_set_of_articles(articles, category_id)
    articles_to_save = articles.map do |article|
      next unless article_valid?(article)

      article.merge(category_id: category_id)
    end.compact

    Article.insert_all(articles_to_save) if articles_to_save.any?
  end
end
