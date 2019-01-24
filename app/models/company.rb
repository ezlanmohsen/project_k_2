class Company < ApplicationRecord
	enum workforce_size: [:no_answer, :less_than_20, :more_than_20] 
	enum work_hours: [:no_preference, :nine_to_nine, :work_at_home] 
	enum strength: [:no_preference_2, :academic, :extra_curricular]

	belongs_to :recruiter
	belongs_to :industry
	belongs_to :state
	has_many :vacancies

end
