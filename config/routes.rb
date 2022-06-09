Rails.application.routes.draw do
  root 'home#main'

  get '/users/sign_in', to: 'sessions#user_sign_in'
  post '/users/sign_in', to: 'sessions#user_perform_sign_in'

  get '/users/sign_up', to: 'sessions#user_sign_up'
  post '/users/sign_up', to: 'sessions#user_perform_sign_up'

  get '/sign_out', to: 'sessions#sign_out'

  get '/users/dashboard', to: 'users#dashboard'

  get '/users/profile', to: 'users#profile'
  post '/users/update_profile', to: 'users#update_profile'

  get '/users/change_password', to: 'users#change_password'
  post '/users/update_password', to: 'users#update_password'

  resources :posts, except: [:edit, :update]
end
