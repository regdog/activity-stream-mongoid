class CommunitiesController < ApplicationController
  def index
  end

  def new
    @community = Community.new
  end

  def create
    @community = Community.new(params[:community])
    if @community.save
      flash[:notice] = "Community has been created."
      render :action => "show"
    end
  end

  def show
    @community = Community.find params[:id]
  end

  def join
    @community = Community.find params[:id]
    @community.users << current_user
    if @community.save
      redirect_to root_path
    end
  end

  def update
  end

  def destroy
  end
end
