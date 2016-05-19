Rails.application.routes.draw do


  devise_for :users
  get 'resumes/index'
  get 'resumes/new'
  get 'resumes/create'
  get 'resumes/destroy'
  # post 'resumes' => 'resumes#new'
  post 'resumes/index'

  get '/members/home'
  post '/members/post_write'
  get '/members/post_destroy/:id' => 'members#post_destroy'
  get '/members/post_edit/:id' => 'members#post_edit'
  get '/members/post_read/:id' => 'members#post_read'
  post '/members/post_update'
  post '/members/comment_write/:id' => 'members#comment_write'
  
  # get 'sessions/new'
  # get 'users/new'

  # get '/sessions/login' => 'sessions#new'
  # post '/sessions/login' => 'sessions#create'
  # delete '/sessions/logout' => 'sessions#destroy'

  root 'home#index'
  
  resources :resumes, only: [:index, :new, :create, :destroy]
  # resources :users

  get '/resumes/index' => 'resumes#index'
end
