Rails.application.routes.draw do
  resources :courses
  resources :teachers

  root 'courses#index'
end
