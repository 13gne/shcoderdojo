Rails.application.routes.draw do
  resources :achievements
  resources :belts
  resources :topics
  namespace :admin do
    resources :users do
      resources :students
    end
    resources :attendances
    resources :courses do
      resources :course_registrations
    end
    resources :course_registrations
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
