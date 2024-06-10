class StaticPagesController < ApplicationController
  before_action :logged_in

  def home
    @subjects = Subject.all.includes(:exams)
  end
end
