class Course <ActiveRecord::Base
  belongs_to :instructor
  has_many :course_students
  has_many :students, :through => :course_students

  def slug
    title.downcase.gsub(" ","-")
  end

  def inst_slug
    instructor.name.downcase.gsub(" ","-")
  end


  def self.find_by_slug(slug)
    Course.all.find{|u| u.slug == slug}
  end

end
