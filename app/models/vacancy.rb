class Vacancy < ApplicationRecord
	belongs_to :company
	belongs_to :recruiter
  has_many :jobseeker_vacancies
  has_many :jobseekers, through: :jobseeker_vacancies

	DEPARTMENT_LIST = [
  	'Accounting & Finance',
  	'Administrative & Management',
  	'Communications & Public Relations',
  	'Customer Service Support',
  	'Distribution & Logistics',
  	'Human Resource & Talent',
  	'IT & Tech',
  	'Legal',
  	'Marketing & Sales',
  	'Operations & Production',
  	'Research & Development'
  ]

  QUESTION_LIST = [
    'Why do you want this job?',
    'What do you know about the company?',
    'What are your greatest professional strengths?',
    'What do you consider to be your weaknesses?',
    'Tell me how you dealt with the biggest challenge in university?',
    'Where do you see yourself in five years?',
    'What type of work environment do you prefer?',
    'How do you deal with pressure or stressful situations?',
    'What would your first 30, 60, or 90 days look like in this role?'
  ]
end
