Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'
  
  resources :panel, only: [:index]

  # Routes for Google authentication
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    delete '/users/sign_out', to: 'devise/sessions#destroy'
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :monthly_operations, only: [:create, :show, :destroy, :update]
      resources :recurring_operations, only: [:create, :show, :destroy, :update]
    end
  end
end
