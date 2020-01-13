Rails.application.routes.draw do
  resources :audible_scrapers
  namespace :api do
    namespace :v1 do
      resources :searches
    end
  end
end
