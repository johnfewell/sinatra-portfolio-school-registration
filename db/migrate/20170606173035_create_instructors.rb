class CreateInstructors < ActiveRecord::Migration[5.1]
  def change
    create_table :instructors do |t|
      t.string :email
      t.string :name
      t.string :password_digest
    end
  end
end
