Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  get 'cities/:state', to: 'application#cities'
  resources :locations
  
  namespace :api , defaults: { format: :json } do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
    end
  end
  
end
