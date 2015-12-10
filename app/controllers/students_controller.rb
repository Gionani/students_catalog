class StudentsController < ApplicationController
      rescue_from ActiveRecord::RecordNotFound do |e|
    render text: "The page you're looking for doesn't exists",
      status: 404
  end

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def edit
    @student = Student.find(params[:id])
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to root_path, notice: 'Student was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @student = Student.find(params[:id])

    if @student.update(student_params)
      redirect_to root_path, notice: 'Student was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to root_path, notice: 'Student was successfully destroyed.'
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :birthdate, :control_number, :semester)
  end
end
