Rails.application.routes.draw do
  resources :klasses
  resources :tests
  resources :tasks
  resources :students
  resources :sessions

  get 'codicon.ttf', to: redirect('https://cdn.jsdelivr.net/npm/monaco-editor@0.45.0/esm/vs/base/browser/ui/codicons/codicon/codicon.ttf')

  resources :submissions, except: [:new]

  get "student/welcome" => "students#welcome", as: :students_welcome
  get "submissions/:task_id/new" => "submissions#new", as: :new_submission

  get "submissions/:submission_id/inspect" => "submissions#sub_inspect", as: :submission_inspect

  get "task_student/:task_id" => "task_student#show", as: :show_task_student

  get "dashboard/index", as: :dashboard
  get "dashboard/class_tasks/:id" => "dashboard#class_tasks", as: :dashboard_class_tasks
  get "dashboard/index_teacher", as: :dashboard_teacher

  get "/sessions/:student_id/new_password" => "sessions#new_password", as: :session_new_password
  post "/sessions/:student_id/new_password" => "sessions#create_password", as: :session_create_password

  get "up" => "rails/health#show", as: :rails_health_check

  delete "/students/:id/klasses/:klass_id" => "students#leave_klass", as: :leave_klass
  post "/klasses/:id/add_student" => "klasses#add_student", as: :add_student_to_klass
  get "/klasses/:id/students" => "klasses#students", as: :edit_students_klass
  post "/klasses/:id/students_search" => "klasses#students_search", as: :students_search_klass
  post "/klasses/:id/report" => "klasses#report", as: :klass_report

  delete "/klasses/:id/remove_task" => "klasses#remove_task", as: :remove_task_from_klass
  post "/klasses/:id/add_task" => "klasses#add_task", as: :add_task_to_klass
  get "/klasses/:id/tasks" => "klasses#tasks", as: :edit_tasks_klass
  post "/klasses/:id/tasks_search" => "klasses#tasks_search", as: :tasks_search_klass

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  root "dashboard#index"
end
