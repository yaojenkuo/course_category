Rails.application.routes.draw do
  resources :courses
  resources :teachers
  resources :abouts, only: [:index]
  resources :contacts, only: [:new, :create]

  root 'courses#index'
end
