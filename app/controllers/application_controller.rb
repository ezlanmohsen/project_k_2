class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_recruiter
  	#@current_user is @current_user or User.find(by session user id)
    @current_recruiter ||= Recruiter.find(session[:recruiter_id]) if session[:recruiter_id]
  end
  #Allows us to use @current_user at all view files
  helper_method :current_recruiter

  # Allow us to use authorize before_action at controller
  def authorize
    redirect_to root_path unless current_recruiter
  end

  #   # Allow us to use same_user in user controller
  # def same_user
  #   redirect_to re_path(current_user) unless (current_user.id == params[:id].to_i || current_user.superadmin?)
  # end
end
