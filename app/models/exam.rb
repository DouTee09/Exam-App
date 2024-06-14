class Exam < ApplicationRecord
  belongs_to :subject
  has_many :answers

  serialize :questions, Array
  validates :name, presence: true, length: { maximum: 255 },
                   uniqueness: true

  validate :questions_and_answers_content_present_and_unique

  private

    def questions_and_answers_content_present_and_unique
      return unless questions.is_a?(Array)

      question_contents = []
      questions.each_with_index do |question, q_index|
        if question['content'].blank?
          errors.add(:base, "Question #{q_index + 1} content can't be blank")
        elsif question_contents.include?(question['content'])
          errors.add(:base, "Question #{q_index + 1} content must be unique")
        else
          question_contents << question['content']
        end

        if question['answers'].is_a?(Array)
          answer_contents = []
          question['answers'].each_with_index do |answer, a_index|
            if answer['content'].blank?
              errors.add(:base, "Answer #{a_index + 1} in question #{q_index + 1} content can't be blank")
            elsif answer_contents.include?(answer['content'])
              errors.add(:base, "Answer #{a_index + 1} in question #{q_index + 1} content must be unique")
            else
              answer_contents << answer['content']
            end
          end
        else
          errors.add(:base, "Answers in question #{q_index + 1} must be an array")
        end
      end
    end
end
