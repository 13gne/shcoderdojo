Rails.application.routes.draw do
  resources :sessions
  namespace :admin do
    resources :users
    resources :courses
    resources :course_registrations
    resources :students
    resources :sessions
    root to: "users#index"
  end

  resources :course_registrations
  resources :students
  resources :courses

  root to: 'visitors#index'
  devise_for :users
  resources :users
end
