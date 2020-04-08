class StudentsController < ApplicationController
  def index
    @students = Student.all

  end

  def show
    @student = Student.includes([:subjects, :teachers]).find(params[:id])
  end
end