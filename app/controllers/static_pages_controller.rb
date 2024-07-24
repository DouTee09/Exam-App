class StaticPagesController < ApplicationController
  before_action :logged_in, only: [:home]

  def home
    user_answer_ids = current_user.answers.includes(:exam).map(&:exam_id)
    @exams = Exam.where.not(id: user_answer_ids)
    @answers = current_user.answers.exp_time_less_than_now.not_submited
  end

  def about
  end

  def contact
  end

  def search
    @users = User.where("name LIKE ?", "%#{params[:query]}%")
    @subjects = Subject.where("name LIKE ?", "%#{params[:query]}%")

    respond_to do |format|
      format.html
      format.js { }
    end
  end
end
