# frozen_string_literal: true

include Api::V1

RSpec.describe 'Articles API', type: :request do
  describe 'GET /api/v1/articles' do
    let(:article_service_instance) { instance_double(ArticleService) }
    let(:articles) { create_list(:article, 3) }

    before do
      allow(ArticleService).to receive(:new).and_return(article_service_instance)
      allow(article_service_instance).to receive(:index).and_return(articles)
      allow(article_service_instance).to receive(:show).and_return(articles.first)
    end

    it 'returns all articles' do
      get api_v1_articles_path, as: :json

      expect(response).to have_http_status(200)
      expect(response.parsed_body['data']).to eq(ArticleBlueprint.render_as_json(articles))
    end

    it 'returns one article' do
      get api_v1_article_path(articles.first), as: :json

      expect(response).to have_http_status(200)
      expect(response.parsed_body['data']).to eq(ArticleBlueprint.render_as_json(articles.first))
    end
  end
end
