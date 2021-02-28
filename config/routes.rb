Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :monthly_operations, only: [:create, :show, :destroy, :update]
      resources :recurring_operations, only: [:create, :show, :destroy, :update]
    end
  end
end
