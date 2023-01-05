Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    mount_devise_token_auth_for 'User', at: 'auth'

    resources :users, only: [:show, :update]
    resources :cars, only: [:index, :show] do
      resources :rentals, only: [:create]
    end

    resources :rentals, only: [:index]

    post 'settings/create/location', to: 'settings#create_location'
    post 'settings/create/color', to: 'settings#create_color'
    post 'settings/create/brand', to: 'settings#create_brand'
    post 'settings/create/car', to: 'settings#create_car'
  end
end
