class CompaniesController < ApplicationController
	def new	
		@company = Company.new	
	end

	def create
		@company = Company.new(company_params)
		@company.recruiter_id = current_recruiter.id
		if @company.save
			redirect_to company_path(@company)
		else
			redirect_back(fallback_location: root_path)
		end
	end

	def show
		@company = Company.find(params[:id])
		if @company.less_than_20? && @company.nine_to_nine?
			@jobseekers = Jobseeker.where("pref_size LIKE (?)", "Small").where("pref_hours LIKE (?)", "Traditional").where(location_id: @company.state).where(degree_id: @company.industry).where("we1_id LIKE (?) OR we2_id LIKE (?) or we3_id LIKE (?)", @company.industry, @company.industry, @company.industry)
		elsif @company.less_than_20? && @company.work_at_home?
			@jobseekers = Jobseeker.where("pref_size LIKE (?)", "Small").where("pref_hours LIKE (?)", "Modern").where(location_id: @company.state).where(degree_id: @company.industry).where("we1_id LIKE (?) OR we2_id LIKE (?) or we3_id LIKE (?)", @company.industry, @company.industry, @company.industry)
		elsif @company.more_than_20? && @company.work_at_home?
			@jobseekers = Jobseeker.where("pref_size LIKE (?)", "Big").where("pref_hours LIKE (?)", "Modern").where(location_id: @company.state).where(degree_id: @company.industry).where("we1_id LIKE (?) OR we2_id LIKE (?) or we3_id LIKE (?)", @company.industry, @company.industry, @company.industry)
		elsif @company.more_than_20? && @company.nine_to_nine?
			@jobseekers = Jobseeker.where("pref_size LIKE (?)", "Big").where("pref_hours LIKE (?)", "Traditional").where(location_id: @company.state).where(degree_id: @company.industry).where("we1_id LIKE (?) OR we2_id LIKE (?) or we3_id LIKE (?)", @company.industry, @company.industry, @company.industry)
		else
			@jobseekers = Jobseeker.where(location_id: @company.state).where(degree_id: @company.industry).where("we1_id LIKE (?) OR we2_id LIKE (?) or we3_id LIKE (?)", @company.industry, @company.industry, @company.industry)
		end

		@vacancies = Vacancy.where(company_id: params[:id])

	end

	private

	def company_params
	  params.require(:company).permit!
	end
end