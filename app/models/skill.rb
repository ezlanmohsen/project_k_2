class Skill < ApplicationRecord
	has_many :jobseekers, :class_name => 'Jobseeker', :foreign_key => 'top_skill_id'
end
