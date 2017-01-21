Rails.application.routes.draw do
  # Keep API in separate namespace
  namespace :api do
    # Good practice to add versioning to API, so new changes doesn't break API that old clients consume
    namespace :v1 do
      resources :web_pages, only: [:index, :create]
    end
  end
end
