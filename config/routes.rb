Rails.application.routes.draw do
  get 'users/index'
  devise_for :users

  root 'users#index'

  resources :canteens do
  	resources :attendance_details
  	resources :memberships do
  		resources :payments
  	end
  end

  resources :customers do
  	resources :attendance_details
  	resources :memberships do
  		resources :payments
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
