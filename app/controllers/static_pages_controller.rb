class StaticPagesController < ApplicationController
  before_action :logged_in

  def home
    user_answer_ids = current_user.answers.includes(:exam).map(&:exam_id)
    @exams = Exam.where.not(id: user_answer_ids)
  end
end
