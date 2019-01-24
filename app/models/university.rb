class University < ApplicationRecord
	has_many :jobseekers, :class_name => 'Jobseeker', :foreign_key => 'university_id'
end


