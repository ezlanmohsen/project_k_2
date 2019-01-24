Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'generic#landing'

	# These routes will be for signup. The first renders a form in the browse, the second will 
	# receive the form and create a user in our database using the data given to us by the user.
	post '/recruiters' => 'recruiters#create'

	post '/login' => 'sessions#create', :as => :create_session
	get '/logout' => 'sessions#destroy'

	resources :companies do
	end

	resources :vacancies do
		get '/interview' => 'vacancies#interview', :as => :interview
		get '/interview/results' => 'vacancies#results', :as => :interview_results
	end

	post '/vacancies/:vacancy_id/jobseeker_vacancies' => 'jobseeker_vacancies#create', :as => :create_match

	resources :jobseekers do
	end
end
