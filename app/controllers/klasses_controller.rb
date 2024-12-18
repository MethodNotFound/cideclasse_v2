class KlassesController < ApplicationController
  before_action :set_klass, only: %i[report tasks tasks_search add_task remove_task students students_search add_student show edit update destroy ]
  before_action :ensure_admin

  # POST /klasses/1/report
  def report
    KlassReportJob.perform_later(@klass.id)
  end

  # POST /klasses/1/add_student
  def add_student
    student = Student.find(params[:student_id])

    unless student.klasses.pluck(:id).any?(@klass.id)
      @klass.students << student
    end
    redirect_to edit_students_klass_path(@klass)
  end

  def remove_task
    task = Task.find(params[:task_id])
    @klass.tasks.delete(task)

    redirect_to edit_students_klass_path(@klass)
  end

  def add_task
    task = Task.find(params[:task_id])

    unless @klass.tasks.pluck(:id).any?(task.id)
      @klass.tasks << task
    end
    redirect_to edit_tasks_klass_path(@klass)
  end

  def students
  end

  def tasks
  end

  def tasks_search
    @tasks_search = Task.where("title LIKE ?", "%#{params[:query]}%").limit(5)

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          "task-list",
          partial: "klasses/tasks_search",
          locals: { tasks_search: @tasks_search, klass: @klass }
        )
      end
    end
  end

  def students_search
    @students_search = Student.where("name LIKE ?", "%#{params[:query]}%").limit(5)

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          "student-list",
          partial: "klasses/students_search",
          locals: { students_search: @students_search, klass: @klass }
        )
      end
    end
  end

  # GET /klasses or /klasses.json
  def index
    @klasses = Klass.all
  end

  # GET /klasses/1 or /klasses/1.json
  def show
  end

  # GET /klasses/new
  def new
    @klass = Klass.new
  end

  # GET /klasses/1/edit
  def edit
  end

  # POST /klasses or /klasses.json
  def create
    @klass = Klass.new(klass_params)

    respond_to do |format|
      if @klass.save
        format.html { redirect_to klass_url(@klass), notice: "Klass was successfully created." }
        format.json { render :show, status: :created, location: @klass }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @klass.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /klasses/1 or /klasses/1.json
  def update
    respond_to do |format|
      if @klass.update(klass_params)
        format.html { redirect_to klass_url(@klass), notice: "Klass was successfully updated." }
        format.json { render :show, status: :ok, location: @klass }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @klass.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /klasses/1 or /klasses/1.json
  def destroy
    @klass.destroy!

    respond_to do |format|
      format.html { redirect_to klasses_url, notice: "Klass was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_klass
      @klass = Klass.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def klass_params
      params.require(:klass).permit!
    end
end
