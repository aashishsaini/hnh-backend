class CreateJoinTableStudentSubject < ActiveRecord::Migration[5.2]
  def change
    create_join_table :students, :subjects do |t|
      t.index [:student_id, :subject_id]
      t.index [:subject_id, :student_id]
    end
  end
end
