class CreateJobseekerVacancies < ActiveRecord::Migration[5.2]
  def change
    create_table :jobseeker_vacancies do |t|
      t.references :jobseeker, foreign_key: true
      t.references :vacancy, foreign_key: true
      t.timestamps
    end
  end
end