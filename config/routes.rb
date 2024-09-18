Rails.application.routes.draw do
  resources :tasks
  resources :students
  resources :sessions

  get "dashboard/index", as: :dashboard
  get "/sessions/:student_id/new_password" => "sessions#new_password", as: :session_new_password
  post "/sessions/:student_id/new_password" => "sessions#create_password", as: :session_create_password

  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  root "dashboard#index"
end
