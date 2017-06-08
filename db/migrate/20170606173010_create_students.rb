class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :email
      t.string :name
      t.string :password_digest
      t.integer :instructors_id
    end
  end
end
