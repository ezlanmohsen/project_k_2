class JobseekerVacancy < ApplicationRecord
	
	belongs_to :jobseeker
	belongs_to :vacancy
end