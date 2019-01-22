Rails.application.routes.draw do
  devise_for :users
  resources :events
  get 'events/new'
  get 'events/:id' => 'events#show'
  post '/events' => 'events#create'
  root :to => "events#index"
  resources :tickets
  post 'tickets/:id' => 'tickets#buy'
  root :to => "tickets#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
