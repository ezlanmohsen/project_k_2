class Industry < ApplicationRecord

	has_many :companies
	has_many :jobseekers, :class_name => 'Jobseeker', :foreign_key => 'degree_id'
	has_many :jobseekers, :class_name => 'Jobseeker', :foreign_key => 'we1_id'
	has_many :jobseekers, :class_name => 'Jobseeker', :foreign_key => 'we2_id'
	has_many :jobseekers, :class_name => 'Jobseeker', :foreign_key => 'we3_id'

end