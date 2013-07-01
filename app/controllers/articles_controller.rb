class ArticlesController < ApplicationController
  def index
  end

  def new
    @community = Community.find params[:community_id]
    @article = Article.new
  end

  def create
    @community = Community.find params[:community_id]
    @article = Article.new(params[:article])
    @community.articles << @article
    if @article.save
      flash[:notice] = "Article has been created."
      current_user.publish_activity(:new_article, :object => @article, :target_object => @community)
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
