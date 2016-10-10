Rails.application.routes.draw do
  resources :users
  	get 'users/new'

	root to: 'static_pages#home'
	
	match "/static_pages/home", to: 'static_pages#home' , via: :get
	match '/help', to: 'static_pages#help', via: :get
	match '/about', to: 'static_pages#about', via: :get
	match '/contact', to: 'static_pages#contact', via: :get
	match '/signup', to: 'users#new' , via: :get
end
