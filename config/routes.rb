Rails.application.routes.draw do
  resources :course_registrations
  resources :students
  get 'dashboard/index'

  resources :courses
  namespace :admin do
    resources :users
    root to: "users#index"
  end
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
