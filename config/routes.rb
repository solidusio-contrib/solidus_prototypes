Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  namespace :admin do
    resources :prototypes do
      member do
        get :select
      end

      collection do
        get :available
      end
    end
  end
end
