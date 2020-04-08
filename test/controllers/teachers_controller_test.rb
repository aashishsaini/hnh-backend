require 'test_helper'

class TeachersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    post teachers_url, params: {teacher: {name: 'test', education: 0}, student_ids: [1], subject_ids: [1]}, as: :json
    assert_response :success
  end

  test "should save the record successfully" do
    @subject = Subject.last
    @student = Student.last
    post teachers_url, params: {teacher: {name: 'test', education: 0}, student_ids: [@student.id], subject_ids: [@subject.id]}, as: :json
    assert_response :success
  end

  test "should get delete" do
    @teacher = Teacher.last
    delete teacher_url(id: @teacher.id)
    assert_response :success
  end

  test "should get unable to delete the record" do
    delete teacher_url(id: 123)
    assert_response :success
  end
end
