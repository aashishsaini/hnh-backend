# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
subject_id = []
['Physics', 'Mathematics', 'Computer science', 'Economics', 'Informatics practices', 'Home science', 'Fine Arts'].each do |subject|
  @subject = Subject.find_or_create_by(name: subject, description: 'NA')
  subject_id << @subject.id
end

@teacher = Teacher.find_by(name: 'Marcus', education: 1)
unless @teacher
  @teacher = Teacher.new(name: 'Marcus', education: 1)
end
@teacher.subjects << Subject.where(id: [subject_id[0], subject_id[1]])
@student = @teacher.students.build(name: 'Marry', roll_number: 1, house: 'Mortal')
@student.subjects << Subject.where(id: [subject_id[0], subject_id[1]])
@student = @teacher.students.build(name: 'Reanna', roll_number: 2, house: 'Mortal')
@student.subjects << Subject.where(id: [subject_id[0], subject_id[1]])
@teacher.save

@teacher = Teacher.find_by(name: 'Marlet', education: 0)
unless @teacher
  @teacher = Teacher.new(name: 'Marlet', education: 0)
end
@teacher.subjects << Subject.where(id: [subject_id[2], subject_id[3]])
@student = @teacher.students.build(name: 'Sara', roll_number: 3, house: 'Mortal')
@student.subjects << Subject.where(id: [subject_id[2], subject_id[3]])
@student = @teacher.students.build(name: 'Shreya', roll_number: 4, house: 'Mortal')
@student.subjects << Subject.where(id: [subject_id[2], subject_id[3]])
@teacher.save
