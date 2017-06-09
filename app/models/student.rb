class Student <ActiveRecord::Base
  has_many :course_students
  has_many :courses, :through => :course_students
  has_many :instructors, :through => :courses
  has_secure_password

  def slug
    username.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    User.all.find{|u| u.slug == slug}
  end

end
