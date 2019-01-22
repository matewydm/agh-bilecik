Rails.application.routes.draw do
  resources :events
  get 'events/new'
  get 'events/:id' => 'events#show'
  post '/events' => 'events#create'
  root :to => "events#index"
  resources :tickets
  root :to => "tickets#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
