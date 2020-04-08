json.student do
  json.name @student.name
  json.roll_number @student.roll_number
  json.house @student.house
end

json.courses @student.subjects do |subject|
  json.id subject.id
  json.name subject.name
  json.description subject.description
  json.teachers subject.teachers.uniq.reject{|s| !@student.teachers.include?(s)} do |teacher|
    json.id teacher.id
    json.name teacher.name
    json.education teacher.education
  end
end

