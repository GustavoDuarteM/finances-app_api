Rails.application.routes.draw do
  
  namespace :users do
    resources :sign_up, only: [:create]
    resources :sign_in, only: [:create]
    resources :refresh, only: [:create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :operations, only: [:create, :show, :destroy, :update]
      resources :recurring_operations, only: [:create, :show, :destroy, :update]
    end
  end
end
