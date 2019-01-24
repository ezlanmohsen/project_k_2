class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.integer :workforce_size, null: false, :default => 0 #Enum = empty, small, big
      t.integer :work_hours, null:false, :default => 0 #Enum = empty, traditional, modern
      t.integer :strength, null:false, :default => 0 #Enum = empty, academic, extracurricular
      t.references :industry, foreign_key: true
      t.references :state, foreign_key: true
      t.references :recruiter, foreign_key: true
      t.timestamps
    end
  end
end
