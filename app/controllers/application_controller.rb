# frozen_string_literal: true

class ApplicationController < ActionController::Base

  private

  def current_user
    return if session[:user_id].blank?
    @current_user ||= User.find(session[:user_id])
  end  
end
