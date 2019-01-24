class Jobseeker < ApplicationRecord
	enum ref_status_1: [:tbc_1, :ok_1]
	enum ref_status_2: [:tbc_2, :ok_2]

	belongs_to :location, :class_name => 'State'
	belongs_to :degree, :class_name => 'Industry'
	belongs_to :university, :class_name => 'University'
	belongs_to :we1, :class_name => 'Industry'
	belongs_to :we2, :class_name => 'Industry'
	belongs_to :we3, :class_name => 'Industry'
	belongs_to :top_knowledge, :class_name => 'Topic'
	belongs_to :top_skill, :class_name => 'Skill'
	belongs_to :top_activity, :class_name => 'Activity'
	has_many :jobseeker_vacancies
	has_many :vacancies, through: :jobseeker_vacancies

end
