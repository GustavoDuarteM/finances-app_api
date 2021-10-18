Rails.application.routes.draw do

  namespace :users do
    resources :sign_up, only: [:create]
    resources :sign_in, only: %i[create] do
      collection do
        delete :destroy
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :operations, only: %i[index create show destroy update]
      resources :total_operations, only: %i[index]
    end
  end
end
