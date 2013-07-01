class HomeController < ApplicationController
  def index
    @users = User.all
    @communities = Community.all

    if current_user
      @activities ||= []
      current_user.communities.each do |community|
      	@activities.concat(community.activities)
      end	
    end

    @activities.sort_by!{|i| i.created_at}.reverse! unless @activities.empty?
  end
end
