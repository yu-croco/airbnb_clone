Rails.application.routes.draw do

  get 'guest_reservation_controller/index'

	root to: 'static_pages#index'

	devise_for :users, controllers: { omniauth_callbacks:  'users/omniauth_callbacks',
			registrations: 'registrations' }

	resources :listings do
		resources :reservations, only: [:create]
	end

	resources :listings do
		resources :photos, only: [:new, :create, :destroy], shallow: true
			collection do
				get :list
			end
	end

	resources :users, only: [:show]

	get '/reservations', to: 'reservations#index'
	get '/guest-reservations', to: 'guest_reservations#index'

end
