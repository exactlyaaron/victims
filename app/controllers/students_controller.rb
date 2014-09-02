class StudentsController < ApplicationController

  def index
    @students = Student.all
    @student = Student.new
  end

  def new
    @student = Student.new
  end

  def create
    @students = Student.all
    @student = Student.new(name: params[:student][:name])
    if @student.save
      redirect_to students_path, notice: "The student, #{@student.name} has been created."
    else
      flash.alert = "Student could not be created."
      render :index
    end
  end

end