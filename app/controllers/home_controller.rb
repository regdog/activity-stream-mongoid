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
  end
end
