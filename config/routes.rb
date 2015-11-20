Rails.application.routes.draw do
  	root 'home#landing_page'
	devise_for :users, :controllers => {:registrations => "registrations", :sessions => "sessions"}
	get :landing_page, to: 'home#landing_page', as: :landing_page
	get :users_index, to: 'home#users_index', as: :users_index
	resources :couriers, only: [:index, :show]
	resources :remittents, only: [:index, :show]
	resources :locations, :except => [:show]
	resources :messages
	
	namespace :api , defaults: { format: :json } do
		resources :locations, only: [:index]
		resources :couriers
		resources :messages
		resources :remittents
		resources :rankings
		get "home/:id/profile", to:"home#profile", as: "profile"
		put "home/:id/edit_profile", to:"home#edit_profile", as: "edit_profile"
	end
end
