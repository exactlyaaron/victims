class StudentsController < ApplicationController

  def index
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path, notice: "The student, #{@student.name} has been created."
    else
      flash.now[:alert] = "Student could not be created."
      render :index
    end
  end

  def pick
    @student = Student.new
    @picked = Student.pick_victim
    if @picked == nil
      redirect_to students_path, :alert => "No one left to call on!"
    else
      @picked.update(called_on: Time.now)
      redirect_to students_path, :notice => "You called on #{@picked.name}"
    end
  end

  protected

  def students
    @students = Student.all
  end
  helper_method :students

  def student_params
    params.require(:student).permit(:name)
  end

end