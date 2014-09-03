class StudentsController < ApplicationController

  def index
    @students = Student.all
    @students.each do |student|
      student.check_time
    end
    @student = Student.new
  end

  def new
    @student = Student.new
  end

  def create
    @students = Student.all
    @student = Student.new(name: params[:student][:name], called_on: 'not yet')
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
    if @picked == nil
      flash.alert = "No one left to call on!"
      render :index
    else
      @picked.update(called_on: Time.now)
      flash.notice = "You called on #{@picked.name}"
      render :index
    end
  end

end