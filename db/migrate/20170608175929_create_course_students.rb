class CreateCourseStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :course_students do |t|
      t.integer :student_id
      t.integer :course_id
    end
  end
end
