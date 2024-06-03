class Exam < ApplicationRecord
  belongs_to :subject
  belongs_to :user
  validates :content, presence: true
end
