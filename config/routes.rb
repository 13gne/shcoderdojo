Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :attendances
    resources :courses, only: [:new, :create, :edit, :update, :destroy]
    root to: 'users#index'
  end
  resources :course_registrations
  resources :students
  resources :courses
  resources :sessions, as: :course_sessions
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
