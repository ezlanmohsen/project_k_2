class Topic < ApplicationRecord
	has_many :jobseekers, :class_name => 'Jobseeker', :foreign_key => 'top_knowledge_id'
end
