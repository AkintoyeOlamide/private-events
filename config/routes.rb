Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'events#index'
  resources :users, only: [:new, :create, :show]
  resources :events, only: [:new, :create, :show, :index]
  get '/attend/:id' => 'users#attend_events', as: :attend
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end
