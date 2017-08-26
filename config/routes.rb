Rails.application.routes.draw do
		root to: 'static_pages#index'

		devise_for :users, controllers: { omniauth_callbacks:  'users/omniauth_callbacks',
				registrations: 'registrations' }

		resources :listings do
			resources :reservations, only: [:create]
		end

		resources :users, only: [:show]
		resources :photos, only: [:create, :destroy] do
			collection do
				get :list
			end
		end

		get 'manage-listings/:id/basics', to: 'listings#basics', as: 'manage_listing_basics'
		get 'manage-listings/:id/description', to: 'listings#description', as: 'manage_listing_description'
		get 'manage-listings/:id/address', to: 'listings#address', as: 'manage_listing_address'
		get 'manage-listings/:id/price', to: 'listings#price', as: 'manage_listing_price'
		get 'manage-listings/:id/photos', to: 'listings#photos', as: 'manage_listing_photos'
		get 'manage-listings/:id/calendar', to: 'listings#calendar', as: 'manage_listing_calendar'
		get 'manage-listings/:id/bankaccount', to: 'listings#bankaccount', as: 'manage_listing_bankaccount'
		get 'manage-listings/:id/publish', to: 'listings#publish', as: 'manage_listing_publish'
end
