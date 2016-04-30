Rails.application.routes.draw do
<<<<<<< HEAD
  get 'resumes/index'

  get 'resumes/new'

  get 'resumes/create'

  get 'resumes/destroy'

  root 'home#index'
  post 'resumes/index'

=======
<<<<<<< HEAD
>>>>>>> d6c74bfd9d5adadd84b1f211ba311ffef16ecc26
  get 'home/index'
  root 'home#index'
=======
  
  get '/' => 'home#index'
>>>>>>> 15f1b7fe27cd70d829c213f32b8031c57d2b7627

<<<<<<< HEAD
  resources :resumes, only: [:index, :new, :create, :destroy]
  


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
=======
>>>>>>> d6c74bfd9d5adadd84b1f211ba311ffef16ecc26

end
