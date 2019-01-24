class SessionsController < ApplicationController
  def new
  end

  def create
    recruiter = Recruiter.find_by_email(params[:email])
    # If the user exists AND the password entered is correct.
    if recruiter && recruiter.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:recruiter_id] = recruiter.id
      flash[:success] = "Succesful Login"
      redirect_to company_path(Company.find_by_recruiter_id(session[:recruiter_id]))
    else
    # If user's login doesn't work, send them back to the login form.
      flash[:alert] = "Failed Login"
      redirect_to '/'
    end
  end

  def destroy
    session[:recruiter_id] = nil
    redirect_to '/'
  end
end
