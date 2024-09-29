Rails.application.routes.draw do
  resources :klasses
  resources :tests
  resources :tasks
  resources :students
  resources :sessions

  get "dashboard/index", as: :dashboard
  get "/sessions/:student_id/new_password" => "sessions#new_password", as: :session_new_password
  post "/sessions/:student_id/new_password" => "sessions#create_password", as: :session_create_password

  get "up" => "rails/health#show", as: :rails_health_check

  delete "/students/:id/klasses/:klass_id" => "students#leave_klass", as: :leave_klass
  post "/klasses/:id/add_student" => "klasses#add_student", as: :add_student_to_klass
  get "/klasses/:id/students" => "klasses#students", as: :edit_students_klass
  post "/klasses/:id/students_search" => "klasses#students_search", as: :students_search_klass

  get "/klasses/:id/tasks" => "klasses#tasks", as: :edit_tasks_klass
  post "/klasses/:id/tasks_search" => "klasses#tasks_search", as: :tasks_search_klass

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  root "dashboard#index"
end
