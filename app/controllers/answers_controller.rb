class AnswersController < ApplicationController
  before_filter :authenticate_user!
  
  load_and_authorize_resource
  
  def create
    @answer = Answer.new(params[:answer])
    @answer.user_id = current_user.id
    if @answer.save!
      flash[:notice] = "Successfully created component."
      redirect_to component_url(@answer.component, :anchor => "q_and_a")
    else
      render :action => 'new'
    end
  end
end
