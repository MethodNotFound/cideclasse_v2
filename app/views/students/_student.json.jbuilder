json.extract! student, :id, :name, :email, :identifier, :password, :ask_new_password, :created_at, :updated_at
json.url student_url(student, format: :json)
