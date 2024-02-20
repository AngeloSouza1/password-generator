Rails.application.routes.draw do
  root 'passwords#index'
  post '/generate_password', to: 'passwords#generate_password'
  post '/reset_fields', to: 'passwords#reset_fields'

end



