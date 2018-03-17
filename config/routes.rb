Rails.application.routes.draw do
  namespace :admin do
    resources :users do
      resources :students do
        resources :student_achievements
      end
    end
    resources :students, only: [:index]
    resources :attendances
    resources :courses do
      resources :course_registrations
      resources :sessions, as: :course_sessions
    end
    resources :course_registrations
    resources :achievements
    resources :belts
    resources :topics
    root to: 'users#index'
  end
  resources :course_registrations
  resources :students
  resources :courses, only: [:index, :show]
  resources :sessions, as: :course_sessions
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
