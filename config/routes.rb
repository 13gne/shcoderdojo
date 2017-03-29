Rails.application.routes.draw do
  resources :course_registrations
  resources :students
  resources :courses
  resources :sessions, as: :course_sessions

  root to: 'visitors#index'
  devise_for :users
  resources :users
end
