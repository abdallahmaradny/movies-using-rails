Rails.application.routes.draw do
  resources :movies do
    collection do
      get 'search_actor', to: 'movies#search_actor'  # Define a custom route for searching actors
    end
  end
end