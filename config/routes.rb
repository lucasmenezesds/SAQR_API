Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :deliveries
    end
  end
  namespace :api do
    namespace :v1 do
      resources :delivery_trucks
    end
  end
  namespace :api do
    namespace :v1 do
      resources :receive_times
    end
  end
  namespace :api do
    namespace :v1 do
      resources :load_times
    end
  end
  namespace :api do
    namespace :v1 do
      resources :storage_times
    end
  end
  namespace :api do
    namespace :v1 do
      resources :picking_times
    end
  end
  namespace :api do
    namespace :v1 do
      resources :trucks
    end
  end
  namespace :api do
    namespace :v1 do
      resources :drivers
    end
  end
  namespace :api do
    namespace :v1 do
      resources :transportation_times
    end
  end
  namespace :api do
    namespace :v1 do
      resources :cities
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :deliveries
  resources :transportation_times
  resources :cities
  resources :cargos
  resources :receive_times
  resources :load_times
  resources :storage_times
  resources :picking_times
  resources :trucks
  resources :drivers

end
