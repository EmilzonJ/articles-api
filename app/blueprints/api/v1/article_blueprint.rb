# frozen_string_literal: true

module Api::V1
  class ArticleBlueprint < Blueprinter::Base
    identifier :id

    fields :author, :content, :description, :published_at, :title, :url, :url_to_image

    association :category, blueprint: CategoryBlueprint
  end
end
