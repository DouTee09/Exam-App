class AnswersController < ApplicationController
  before_action :logged_in

  def index
    if current_user.role == 1
      @answers = Answer.all
    else
      @answers = current_user.answers
    end
  end

  def show
    @answer = current_user.answers.find_by_id(params[:id])
  end

  def edit
    @subject = Subject.find_by_id(params[:subject_id])
    @exam = @subject.exams.find_by_id(params[:exam_id])
    @answer = @exam.answers.find_by_id(params[:id])
    if @answer.exp_time < Time.now || @answer.isSubmit
      flash[:danger] = "Answer has already been submitted"
      redirect_to root_path
    end
  end

  def new
    @subject = Subject.find_by_id(params[:subject_id])
    @exam = @subject.exams.find_by_id(params[:exam_id])
    exam_complate_ids = @current_user.answers.collect(&:exam_id)
    if exam_complate_ids.include?(@exam.id)
      flash[:danger] = "Answer has already been submitted"
      redirect_to root_path
    else
      @answer = @exam.answers.new(user_id: current_user.id, exp_time: Time.now + @exam.time.minutes)
      @answer.save!
    end
  end

  def update
    @subject = Subject.find_by_id(params[:subject_id])
    @exam = @subject.exams.find_by_id(params[:exam_id])
    @answer = current_user.answers.find_by_id params[:id]

    if @answer.update(questions: JSON.parse(answer_params[:questions].to_json))
      @answer.calculate_score
      flash[:success] = "Created answer successfully"
      redirect_to home_path
    else
      flash[:danger] = "Can't create answer"
      render :new
    end
  end

  private
    def answer_params
      params.require(:answer)
    end
end
