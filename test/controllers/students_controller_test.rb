require 'test_helper'

class StudentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get students_url
    assert_response :success
  end

  test "should get show" do
    @student = Student.last
    get student_url(id: @student.id)
    assert_response :success
  end

end
