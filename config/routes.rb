Rails.application.routes.draw do

	get 'guest_reservation_controller/index'

	root to: 'static_pages#index'

	devise_for :users, controllers: { omniauth_callbacks:  'users/omniauth_callbacks',
			registrations: 'registrations' }

	resources :listings do
		resources :reservations, only: [:new, :create]
	end

	resources :listings do
		resources :photos, only: [:new, :create, :destroy], shallow: true
			collection do
				get :list
			end
	end

	resources :users do
		resources :bank_accounts, only: [:index, :new], shallow: true
	end

	resources :users, only: [:show]

	get '/reservations', to: 'reservations#index'
	get '/guest-reservations', to: 'guest_reservations#index'

	#stripe connect oauth path
	get '/connect/oauth' => 'stripe#index', as: 'stripe_oauth'
	get '/connect/confirm' => 'stripe#create', as: 'stripe_confirm'
	get '/connect/deauthorize' => 'stripe#destroy', as: 'stripe_deauthorize'

end
