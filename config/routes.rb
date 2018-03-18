Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'

      resources :deliveries
      resources :transportation_times
      resources :cities
      resources :delivery_trucks
      resources :receive_times
      resources :load_times
      resources :storage_times
      resources :picking_times
      resources :trucks
      resources :drivers
      resources :users, only: [:update]
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
