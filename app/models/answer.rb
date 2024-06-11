class Answer < ApplicationRecord
  belongs_to :exam
  belongs_to :user

  serialize :questions, Array
end
