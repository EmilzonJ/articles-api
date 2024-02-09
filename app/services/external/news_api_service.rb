# frozen_string_literal: true

class External::NewsApiService < ApplicationService
  API_KEY = ENV.fetch('NEWS_API_KEY')
  BASE_URL = 'https://newsapi.org/v2/'

  def initialize(base_url = BASE_URL)
    @base_url = base_url
    @connection = Faraday.new(url: @base_url) do |f|
      f.request :json
      f.adapter Faraday.default_adapter
    end
  end

  def get_top_headlines(category: 'general', country: 'us', page: 1, page_size: 10)
    params = get_query_params(category, country, page, page_size)
    send_http_request('top-headlines', params)
  end

  private

  def get_query_params(category, country, page, page_size)
    {
      category: category,
      country: country,
      page: page,
      pageSize: page_size,
      apiKey: API_KEY
    }
  end

  def send_http_request(url, query_params)
    response = @connection.get(url, query_params)

    if response.success?
      {
        success: response.success?,
        body: JSON.parse(response.body, symbolize_names: true)
      }
    else
      {
        success: response.success?
      }
    end
  rescue StandardError
    {
      success: false
    }
  end
end
