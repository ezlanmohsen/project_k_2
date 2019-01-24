class JobseekerVacanciesController < ApplicationController
	def create
		@match = JobseekerVacancy.new
		@match.jobseeker_id = match_params[:jobseeker_id]
		@match.vacancy_id = params[:vacancy_id]
		if @match.save
			redirect_back(fallback_location: root_path)
		else
			redirect_to root_path
		end
	end

	private
		def match_params
		  params.require(:jobseeker_vacancy).permit!
		end
end