class QuestionsController < ApplicationController
  def index
  end

  def new
    @community = Community.find params[:community_id]
    @question = Question.new
  end

  def create
    @community = Community.find params[:community_id]
    @question = Question.new(params[:question])
    @community.questions << @question
    if @question.save
      flash[:notice] = "Question has been created."
      current_user.publish_activity(:new_question, :object => @question, :target_object => @community)
      redirect_to community_path(@community)
    end
  end

  def show
  end

  def update
  end

  def destroy
  end
end
