class TeachersController < ApplicationController
  def create
    @teacher = Teacher.new(teacher_params)
    @teacher.subjects << Subject.where(id: params[:subject_ids])
    @teacher.students << Student.where(id: params[:student_ids])
    if @teacher.subjects.blank?
      render json: {error: "Subjects Can't be blank", status: :unprocessable_entity}
    else
      if @teacher.save
        render json: {teacher: @teacher, status: :success}
      else
        render json: {error: @teacher.errors.full_messages.join(','), status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @teacher = Teacher.find_by(id: params[:id])
    if @teacher && @teacher.destroy
      render json: {message: 'Record Deleted Successfully', status: :success}
    else
      render json: {error: "Unable to delete the Teacher", status: :unprocessable_entity}
    end
  end


  private
  def teacher_params
    params.require(:teacher).permit(:name, :education, :id)
  end
end