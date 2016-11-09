Rails.application.routes.draw do
  root 'sources#index'
  resources :sources, only: [:show] do
  	resources :home_works, only: [:index]
  	get :all_events
  end
  resources :sessions, only: [:new, :create]
  resources :events, only: [] do
    resources :home_works, except: [:index]
  end
end
