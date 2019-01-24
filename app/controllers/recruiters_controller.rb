class RecruitersController < ApplicationController

    def create
	  recruiter = Recruiter.new(recruiter_params)
	  if recruiter.save
	    session[:recruiter_id] = recruiter.id
	    redirect_to new_company_path
	    #change redirect later
	  else
	    redirect_to '/'
	  end
    end 

	private 

	def recruiter_params
	  params.require(:recruiter).permit!
	end
end
