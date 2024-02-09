# frozen_string_literal: true

include Api::V1

RSpec.describe 'Categories API', type: :request do
  describe 'GET /api/v1/categories' do
    let(:category_service_instance) { instance_double(CategoryService) }
    let(:categories) { create_list(:category, 3) }

    before do
      allow(CategoryService).to receive(:new).and_return(category_service_instance)
      allow(category_service_instance).to receive(:index).and_return(categories)
      allow(category_service_instance).to receive(:show).and_return(categories.first)
    end

    it 'returns all categories' do
      get api_v1_categories_path, as: :json

      expect(response).to have_http_status(200)
      expect(response.parsed_body['data']).to eq(CategoryBlueprint.render_as_json(categories))
    end

    it 'returns one category' do
      get api_v1_category_path(categories.first), as: :json

      expect(response).to have_http_status(200)
      expect(response.parsed_body['data']).to eq(CategoryBlueprint.render_as_json(categories.first))
    end
  end
end
