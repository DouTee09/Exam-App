class Exam < ApplicationRecord
  belongs_to :subject

  serialize :questions, Array
end
