class CreateRecruiters < ActiveRecord::Migration[5.2]
  def change
    create_table :recruiters do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :company_temp, null: false
      t.integer :mobile, null: false
      t.string :password_digest

      t.timestamps
    end
  end
end
