require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  test "#validate associations, show subject count 0 if no course associated with student" do
    @student = Student.last
    assert_equal 0,  @student.subjects.size
  end

  test "#validate associations, show subject count if course is associated with student" do
    @student = Student.last
    @subject = Subject.last
    @student.subjects <<  @subject
    @student.save

    assert_equal 1,  @student.subjects.size
  end

  test "#validate associations, show subject count 0 if no teacher associated with student" do
    @student = Student.last
    assert_equal 0,  @student.teachers.size
  end

  test "#validate associations, show subject count if teacher is associated with student" do
    @student = Student.last
    @teacher = Teacher.last
    @student.teachers <<  @teacher
    @student.save

    assert_equal 1,  @student.teachers.size
  end
end
