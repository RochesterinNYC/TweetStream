TweetStream::Application.routes.draw do

  resources :tweets
  resources :user_profiles
  resources :searches

  get '/auth/:provider/callback' => 'sessions#create'   # callback for twitter oauth
  # resources :sessions, :only => [:create]
  # match '/auth/twitter' => redirect('/auth/twitter'), as: :login, :via => [:all]
  match '/logout' => 'sessions#destroy', :as => :logout, :via => [:delete, :get]
  get "/dashboard" => 'stream#index', :as => 'dashboard'
  root :to => 'stream#index'

  post '/validate' => 'stream#validate', :as => 'validate'
  get "/stream" => 'stream#stream', :as => 'stream'
  get "/stream_search" => 'stream#stream_search', :as => 'stream_search'
  get '/welcome', to: 'site#welcome', :as => 'welcome'
  get '/signup', to: 'users#new', :as => "signup"
  get '/users', to: 'users#index', :as => 'users'
  get '/users/:id', to: 'users#show', :as => 'user'
  get '/login', to: 'sessions#new', :as => "login"
  # post '/logout' => 'sessions#destroy', :as => 'logout'

  # post '/verify' => 'sessions#create', :as => 'verify'
  post 'users/create' => 'users#create'
  get 'users/confirm' => 'users#confirm'
  get '/users/:id/edit' => 'users#edit', :as => 'edit_user'
  put '/users/:id' => 'users#update'
  post '/users/resend' => 'users#resend'
  get '/users/broadcast' => 'users#broadcast'
  post '/users/broadcast_out' => 'users#broadcast_out', :as => 'broadcast_out'

  #reset request form
  get '/reset/forgot' => 'reset#new', :as => 'forgot_password'
  #generates reset link and sends email out
  post '/reset/generate' => 'reset#generate', :as => 'generate'
  #pass word reset form
  get '/reset' => 'reset#password', :as => 'reset'
  #actually resets password
  post '/reset/password' => 'reset#change_password', :as => 'reset_password'

  resources :sessions
end
