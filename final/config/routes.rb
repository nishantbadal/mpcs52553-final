Rails.application.routes.draw do
    root 'posts#index'
    resources :posts
    
  get 'admin', :to => 'access#menu'
  get 'access/menu'
  get 'access/login'
  get 'access/signup'
  post 'access/signupAttempt'
  post 'access/attempt'
  get 'access/logout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    
    
    
end
