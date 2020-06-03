Rails.application.routes.draw do
  resources :tweets
  get 'users/login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'password/forgot', to: 'passwords#forgot'
  post 'password/reset', to: 'passwords#reset'

end
