class Recruiter < ApplicationRecord
	has_secure_password

	has_many :companies
	has_many :vacancies
end
