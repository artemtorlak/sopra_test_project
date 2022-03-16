Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "serials#index"

  resources :serials do
    collection do
      get :index
      get :search
    end
  end
end
