Rails.application.routes.draw do


  root 'static_pages#home'
  get '/about', to:'static_pages#about'
  get '/signup', to:'users#new'
  post '/signup', to:'users#create'
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'
  post '/done' , to: 'situations#update'



  resources :situations,only:[:create,:edit,:update,:new,:delete]
  resources :tasks
  resources :users
  resources :account_activations,only:[:edit]
  resources :password_resets,only:[:new,:create,:edit,:update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
