Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'events#index'
  resources :users, only: [:new, :create, :show]
  resources :events, only: [:new, :create, :show, :index]
  get '/attend/:user_id/:event_id' => 'users#attend_events', as: :attend
  get '/withdraw/:user_id/:event_id' => 'users#withdraw_events', as: :withdraw
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/inviteUsers/:event_id' => 'users#index', as: :inviteUsers
  get '/invite/:user_id/:event_id' => 'users#inviteUser', as: :invite
  get '/cancel/:user_id/:event_id' => 'users#cancelInviteUser', as: :cancel
end
