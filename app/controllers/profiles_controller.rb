class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @relationship = current_user.relationships.find_by(follow_id: @user.id) || current_user.relationships.build(follow_id: @user.id)
  end
end