class CreateUserDepartments < ActiveRecord::Migration
  def change
    create_table :user_departments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :company_number, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
