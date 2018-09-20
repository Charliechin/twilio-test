Rails.application.routes.draw do
  get  'home/index'
  get  'home/verify', to: 'home#show_verify', as: 'verify'
  post 'home/resend'
  post 'home/verify'
  get  'home/students'
  get  'home/call'
  post 'token/generate' => "token#generate"
  post 'token/generate_video' => "token#generate_video"
  post 'call/connect' => "call#connect"
  get  'video_call/index' => "video_call#index"



  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
