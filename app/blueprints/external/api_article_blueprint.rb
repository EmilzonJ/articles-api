# frozen_string_literal: true

class External::ApiArticleBlueprint < Blueprinter::Base
  fields :author, :title, :description, :url, :content

  field :url_to_image do |article|
    article[:urlToImage]
  end

  field :published_at do |article|
    article[:publishedAt].to_datetime
  end
end
