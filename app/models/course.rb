class Course <ActiveRecord::Base
  has_many :institute
  has_many :students

  def slug
    username.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    User.all.find{|u| u.slug == slug}
  end

end
