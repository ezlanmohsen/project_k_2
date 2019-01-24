class CreateVacancies < ActiveRecord::Migration[5.2]
  def change
    create_table :vacancies do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.references :recruiter, foreign_key: true
      t.references :company, foreign_key: true
      t.string :department, null: false
      t.integer :quantity, null:false, :default => 0
      t.string :question_1
      t.string :question_2
      t.string :question_3
      t.string :question_4
      t.string :question_5
      t.timestamps
    end
  end
end
