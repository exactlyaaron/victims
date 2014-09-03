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
    @student = Student.new(name: params[:student][:name], called_on: nil)
    if @student.save
      redirect_to students_path, notice: "The student, #{@student.name} has been created."
    else
      flash.alert = "Student could not be created."
      render :index
    end
  end

  def pick
    @students = Student.all
    @student = Student.new
    @picked = Student.pick_victim
    flash.alert = "You called on #{@picked.name}"
    render :index
  end

end