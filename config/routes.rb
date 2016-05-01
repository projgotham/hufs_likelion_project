Rails.application.routes.draw do

  get 'resumes/index'

  get 'resumes/new'

  get 'resumes/create'

  get 'resumes/destroy'

  root 'home#index'
  post 'resumes/index'

  resources :resumes, only: [:index, :new, :create, :destroy]

end
