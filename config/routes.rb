Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    mount_devise_token_auth_for 'User', at: 'auth'

    resources :users, only: [:show, :update]
    resources :cars, only: [:index, :show] do
      resources :rentals, only: [:create]
    end

    resources :rentals, only: [:index]
  end
end
