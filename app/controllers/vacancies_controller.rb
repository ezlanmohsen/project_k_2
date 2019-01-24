class VacanciesController < ApplicationController
	def new
		@vacancy = Vacancy.new
	end

	def create
		@vacancy = Vacancy.new(vacancy_params)
		@vacancy.recruiter_id = current_recruiter.id
		@company = Company.find_by(recruiter_id: current_recruiter.id)
		@vacancy.company_id = @company.id
		if @vacancy.save
			redirect_to vacancy_path(@vacancy)
		else
			redirect_back(fallback_location: root_path)
		end
	end

	def show
		@vacancy = Vacancy.find(params[:id])
		@company = Company.find(@vacancy.company.id)
		@degrees = Industry.all
		@knowledges = Topic.all
		@skills = Skill.all
		@activities = Activity.all
		@matches = JobseekerVacancy.where(vacancy_id: params[:id])

	  	if params[:degree] 
	      	@jobseekers = Jobseeker.where(location_id: @company.state).where("we1_id LIKE (?) OR we2_id LIKE (?) or we3_id LIKE (?)", @company.industry, @company.industry, @company.industry).where(degree_id: params[:degree])
	    elsif params[:knowledge]
	    	@jobseekers = Jobseeker.where(location_id: @company.state).where("we1_id LIKE (?) OR we2_id LIKE (?) or we3_id LIKE (?)", @company.industry, @company.industry, @company.industry).where(top_knowledge_id: params[:knowledge])
	    elsif params[:activity]
	    	@jobseekers = Jobseeker.where(location_id: @company.state).where("we1_id LIKE (?) OR we2_id LIKE (?) or we3_id LIKE (?)", @company.industry, @company.industry, @company.industry).where(top_knowledge_id: params[:activity])
	    elsif params[:skill]
    		@jobseekers = Jobseeker.where(location_id: @company.state).where("we1_id LIKE (?) OR we2_id LIKE (?) or we3_id LIKE (?)", @company.industry, @company.industry, @company.industry).where(top_knowledge_id: params[:skill])
    	else
			@jobseekers = Jobseeker.where(location_id: @company.state).where("we1_id LIKE (?) OR we2_id LIKE (?) or we3_id LIKE (?)", @company.industry, @company.industry, @company.industry)
	    end

	    @match = JobseekerVacancy.new
	end

	def interview
		@vacancy = Vacancy.find(params[:vacancy_id])
		@company = Company.find(@vacancy.company.id)
		@matches = JobseekerVacancy.where(vacancy_id: @vacancy.id)	
	end

	def update
		@vacancy = Vacancy.find(params[:id])
		if @vacancy.update(vacancy_params)
			redirect_to company_path(current_recruiter)
		else
			redirect_back(fallback_location: root_path)
		end
	end

	def results
		@vacancy = Vacancy.find(params[:vacancy_id])
		@company = Company.find(@vacancy.company.id)
		@matches = JobseekerVacancy.where(vacancy_id: @vacancy.id)
	end

	private

	def vacancy_params
	  params.require(:vacancy).permit!
	end
end
