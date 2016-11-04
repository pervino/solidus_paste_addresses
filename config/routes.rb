Spree::Core::Engine.routes.draw do
  namespace :api do
    resources :addresses, only: [] do
      get :parse, on: :collection
    end
  end
end