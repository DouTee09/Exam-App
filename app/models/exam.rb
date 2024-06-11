class Exam < ApplicationRecord
  belongs_to :subject
  has_many :answers

  serialize :questions, Array
end
