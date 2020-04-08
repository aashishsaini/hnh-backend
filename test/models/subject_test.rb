require 'test_helper'

class SubjectTest < ActiveSupport::TestCase
  test "#validate associations, show students count 0 if no course associated with student" do
    @subject = Subject.last
    assert_equal 0,  @subject.students.size
  end

  test "#validate associations, show subject count if course is associated with student" do
    @student = Student.last
    @subject = Subject.last
    @subject.students <<  @student
    @subject.save

    assert_equal 1,  @subject.students.size
  end

  test "#validate associations, show teacher count 0 if no teacher associated with subjects" do
    @subject = Subject.last
    assert_equal 0,  @subject.teachers.size
  end

  test "#validate associations, show subject count if teacher is associated with subject" do
    @subject = Subject.last
    @teacher = Teacher.last
    @subject.teachers <<  @teacher
    @subject.save

    assert_equal 1,  @subject.teachers.size
  end
end
