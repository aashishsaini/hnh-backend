class Teacher < ApplicationRecord
  has_and_belongs_to_many :students
  has_and_belongs_to_many :subjects

  enum education: %w{Graduate Masters}
end
