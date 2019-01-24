class JobseekersController < ApplicationController
	def show
		@jobseeker = Jobseeker.find(params[:id])
	end
end