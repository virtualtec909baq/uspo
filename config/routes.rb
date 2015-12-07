Rails.application.routes.draw do
  	root 'home#landing_page'
	devise_for :users, :controllers => {:registrations => "registrations", :sessions => "sessions"}
	get :landing_page, to: 'home#landing_page', as: :landing_page
	get :index, to: 'home#index', as: :index
	get :privacy, to: 'home#privacy', as: :privacy
	get :terms, to: 'home#terms', as: :terms
	get :service_support, to: 'home#service_support', as: :service_support
	get "home/:id/profile", to:"home#profile", as: "profile"
	resources :couriers, only: [:index, :show]
	resources :remittents, only: [:index, :show]
	resources :locations, :except => [:show]
	resources :messages
	resources :settins
	
	namespace :api , defaults: { format: :json } do
		resources :couriers
		resources :remittents
		resources :rankings
		resources :locations, only: [:index]
		resources :packages
		resources :messages, only: [:index, :create, :show]
		get "home/:id/profile", to:"home#profile", as: "profile"
		put "home/:id/edit_profile", to:"home#edit_profile", as: "edit_profile"
	end
end
