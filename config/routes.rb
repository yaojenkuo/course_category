Rails.application.routes.draw do
  devise_for :users
  resources :courses
  resources :teachers
  resources :abouts, only: [:index]
  resources :contacts, only: [:new, :create]

  root 'courses#index'
  get '*path' => redirect('/')
end
