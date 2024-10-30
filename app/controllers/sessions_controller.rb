class SessionsController < ApplicationController
  # GET /sessions/new
  def new
    @attrs = {}
  end


  # POST /sessions or /sessions.json
  def create
    @attrs = params

    if params[:identifier] == "admin" && params[:password] == "owo"
      session[:current_session_id] = "admin"
      respond_to do |format|
        format.html { redirect_to klasses_path, notice: "Logado" }
        format.json { render json: {success: "logged as admin"} }
      end
      return
    end

    related_student = Student.find_by(identifier: params[:identifier])

    if related_student.nil?
      @errors = ["aluno não encontrado"]
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: {errors: @errors}, status: :unprocessable_entity }
      end
      return
    end

    if related_student.ask_new_password?
      @errors = ["crie uma nova senha #{session_create_password_url(related_student.id)}"]
      respond_to do |format|
        format.html { redirect_to session_new_password_url(related_student) }
        format.json { render json: {errors: @errors}, status: :unprocessable_entity }
      end
      return
    end

    if !related_student.authenticate(params[:password])
      @attrs = params
      @errors = ["senha errada"]
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: {errors: @errors}, status: :unprocessable_entity }
      end
      return
    end

    @session = Session.new(
      student: related_student,
      active: true,
      metadata: {}
    )

    respond_to do |format|
      if @session.save
        session[:current_session_id] = @session.id
        format.html { redirect_to dashboard_path, notice: "Logado" }
        format.json { render json: {success: "logged as student"} }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  def new_password
    @attrs = {}
  end

  def create_password
    params.permit!
    if params[:password].nil? || params[:password].size < 6
      @attrs = params.to_h
      @errors = ["Senha dever ter pelo menos 6 caracteres"]
      respond_to do |format|
        format.html { render :new_password, status: :unprocessable_entity }
        format.json { render json: {errors: @errors}, status: :unprocessable_entity }
      end
      return
    end


    student = Student.find(params[:student_id])
    student.password = params[:password]
    student.ask_new_password = false

    respond_to do |format|
      if student.save
        format.html { redirect_to new_session_url, notice: "Senha criada" }
        format.json { render json: {success: "senha criada"}, status: :created }
      else
        @attrs = params.to_h
        @errors = student.errors
        format.html { render :new_password, status: :unprocessable_entity }
        format.json { render json: {errors: @errors}, status: :unprocessable_entity }
      end
    end
  end
end
