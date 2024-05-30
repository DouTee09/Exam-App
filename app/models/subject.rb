class Subject < ApplicationRecord
  has_many :users
  has_many :exams
  validates :name, presence: true
end
