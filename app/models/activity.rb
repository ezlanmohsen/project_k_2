class Activity < ApplicationRecord
	has_many :jobseekers, :class_name => 'Jobseeker', :foreign_key => 'top_activity_id'
end
