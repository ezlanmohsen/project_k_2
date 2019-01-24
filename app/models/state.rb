class State < ApplicationRecord
	has_many :companies
	has_many :jobseekers, :class_name => 'Jobseeker', :foreign_key => 'location_id'

end



