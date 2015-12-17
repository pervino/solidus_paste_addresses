Spree::Core::Engine.add_routes do
  namespace :api do
    resources :addresses, only: [] do
      get :parse, on: :collection
    end
  end
end