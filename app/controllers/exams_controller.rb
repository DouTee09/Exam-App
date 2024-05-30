class ExamsController < ApplicationController
  before_action :logged_in
  def index
    @subject = Subject.find(params[:subject_id])
  end
end
