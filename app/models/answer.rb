class Answer < ApplicationRecord
  belongs_to :exam
  belongs_to :user

  serialize :questions, Array

  scope :exp_time_less_than_now, -> { where("? <= exp_time", Time.now) }
  scope :not_submited, -> { where(isSubmit: false) }

  def calculate_score
    exam_questions = self.exam.questions
    user_correct_answers = []
    exam_correct_answers = []
    score_count = 0

    user_correct_answers = questions.map do |question|
      question["answer"].select { |answer| answer["status"].present? }
    end.flatten

    exam_correct_answers = exam_questions.map do |exam_question|
      exam_question["answers"].select { |answer| answer["status"].present? }
    end.flatten

    user_correct_answers.each_with_index do |answer, index|
      score_count += 1 if exam_correct_answers[index] == answer
    end
    score = (score_count * 1.0 / exam_correct_answers.length)*10

    update(score: score, isSubmit: true)
  end
end
