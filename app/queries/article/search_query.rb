# frozen_string_literal: true

class Article::SearchQuery
  include LimitOffsetPaginationConcern

  def call(params)
    @items = Article.search(params)

    limit_page_paginate(blueprint: Api::V1::ArticleBlueprint, page: params[:page], limit: params[:limit])
  end
end
