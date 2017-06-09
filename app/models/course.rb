class Course <ActiveRecord::Base
  belongs_to :instructor
  has_many :course_students
  has_many :students, :through => :course_students

  def slug
    username.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    User.all.find{|u| u.slug == slug}
  end

end
