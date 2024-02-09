# frozen_string_literal: true

namespace :api do
  namespace :v1 do
    resources :articles, only: %i[index show] do
      get :search, on: :collection
    end
    resources :categories, only: %i[index show]
  end
end
