Rails.application.routes.draw do
  get 'home/assesor'
  get 'home/student'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#assesor"
end
