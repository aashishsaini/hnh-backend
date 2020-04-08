require 'test_helper'

class TeacherTest < ActiveSupport::TestCase
  test "#validate associations, show subject count 0 if no course associated with teacher" do
    @teacher = Teacher.last
    assert_equal 0,  @teacher.subjects.size
  end

  test "#validate associations, show subject count if course is associated with teacher" do
    @teacher = Teacher.last
    @subject = Subject.last
    @teacher.subjects <<  @subject
    @teacher.save

    assert_equal 1,  @teacher.subjects.size
  end

  test "#validate associations, show student count 0 if no teacher associated with student" do
    @teacher = Teacher.last
    assert_equal 0,  @teacher.students.size
  end

  test "#validate associations, show student count if teacher is associated with student" do
    @teacher = Teacher.last
    @student = Student.last
    @teacher.students <<  @student
    @teacher.save

    assert_equal 1,  @teacher.students.size
  end
end
