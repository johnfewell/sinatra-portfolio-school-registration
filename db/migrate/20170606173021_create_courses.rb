class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :start_date
      t.integer :weeks
      t.string :semester
      t.integer :year
      t.integer :students_id
    end
  end
end
