class CreateJobseekers < ActiveRecord::Migration[5.2]
  def change
    create_table :jobseekers do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.references :location
      t.references :degree
      t.references :university
      t.decimal :cgpa, precision: 4, scale: 2, null: false
      t.string :pref_size, null: false
      t.string :pref_hours, null: false
      t.integer :ref_status_1, :default => 0
      t.integer :ref_status_2, :default => 0
      t.references :we1
      t.references :we2
      t.references :we3
      t.integer :knowledge_score, null: false
      t.integer :skill_score, null: false
      t.integer :activity_score, null: false 
      t.references :top_knowledge 
      t.references :top_skill 
      t.references :top_activity
      t.timestamps
    end
  end
end
