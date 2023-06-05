class RelationshipsController < ApplicationController
  before_action :set_user

  def create
    following = current_user.follow(@user)
    if following.save
      current_user.update_follow_counts
      redirect_to profile_path(@user)
    else
      redirect_to profile_path(@user)
    end
  end
  
  def destroy
    following = current_user.unfollow(@user)
    if following.destroy
      current_user.update_follow_counts
      redirect_to profile_path(@user)
    else
      redirect_to profile_path(@user)
    end
  end  

  private

  def set_user
    @user = User.find(params[:relationship][:follow_id])
  end
end
