class RemovePasswordFromInstructors < ActiveRecord::Migration[5.1]
  def change
    remove_column :instructors, :password_digest, :string
  end
end
