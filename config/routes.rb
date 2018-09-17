Rails.application.routes.draw do
  get  'home/index'
  get  'home/verify', to: 'home#show_verify', as: 'verify'
  post 'home/resend'
  post 'home/verify'
  get  'home/students'
  get  'home/call'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
