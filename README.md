# sinatra-portfolio-school-registration
This is my Learn.co Sinatra portfolio project.

#Overview

This app allows the tracking of classes, students, and instructors.

#Courses

You can view all the Courses now offered by the school and you can view the students in a class. Also, you can view which instructors is assigned to teach which class.

#Instructors

You can view all of the instructors employed by the school, and you can view all the classes taught by a particular instructor. In addition, you can view all of the students taught by a particular instructor.

#Students

You can view all of the students at the school.

#For my reference

s = Student.first
teach = Institute.first
c = Course.first

s1 = Student.create(:name => "Seva", :email => "seva@test.com", :password => "test")
s2 = Student.create(:name => "Ronnie", :email => "ron@test.com", :password => "test")
s3 = Student.create(:name => "Mike", :email => "mike@test.com", :password => "test")
s4 = Student.create(:name => "Josh", :email => "josh@test.com", :password => "test")
s5 = Student.create(:name => "Dave", :email => "dave@test.com", :password => "test")

i1 = Instructor.create(:name => "Sheri", :email => "sher@test.com", :password => "test")
i2 = Instructor.create(:name => "Grace", :email => "grace@test.com", :password => "test")
i3 = Instructor.create(:name => "Rachel", :email => "rachel@test.com", :password => "test")
i4 = Instructor.create(:name => "Marsha", :email => "marsha@test.com", :password => "test")
i5 = Instructor.create(:name => "Ellen", :email => "ellen@test.com", :password => "test")

c1 = Course.create(:title => "Intro to stuff", :start_date => "9/1", :weeks => "8", :semester => "Winter", :year => "2016")
c2 = Course.create(:title => "Intermediate stuff", :start_date => "9/1", :weeks => "16", :semester => "Winter", :year => "2016")
c3 = Course.create(:title => "Advanced stuff", :start_date => "9/1", :weeks => "8", :semester => "Spring", :year => "2017")
c4 = Course.create(:title => "Fun Elective", :start_date => "2/15", :weeks => "16", :semester => "Spring", :year => "2017")
c5 = Course.create(:title => "Optional Class", :start_date => "2/15", :weeks => "4", :semester => "Spring", :year => "2017")

models
  Students have many classes, have many instructors. Have secure passwords
  Instructors have many classes, have many students through classes. Have secure passwords
  Classes have many students, have many instructors

db
  students have names, emails, instructors_id #
  instructors have name, emails, students through classes  #
  classes have title, start date, end date, weeks, semester, year, students_id #

views
  main page - sign in, sign up
  index, logged in - show links for classes, students, instructors
  classes
    all classes - displays all classes with links to individual class pages
    one class - displays all students and instructors of class with links to their pages
    edit class - edit students in class and instructors with checkboxes
    new class - create a new class
  students
    all students - displays all students with links to individual student pages. For students, only a link to their own page
    one student - displays all classes and instructors of student with links to individual pages
    edit student -
    new student
  instructors
    all instructors - displays all instructors with links to individual instructor pages
    one instructor - displays all classes and students of instructor
    edit instructor - edit information and classes with checkboxes
    new instructor - create a new instructor
  users
    sign in
    sign up

controllers

  / if logged out signup etc, if logged in the main index

  classes
    get all
    get one
    get edit - only if instructor
    post edit
    get new - only if instructor
    post new
    delete class
  students
    get all -
    get one - for students, only themselves
    get edit - for students, only themselves
    post edit - for students, only themselves
    get new - view only if instructor
    post new - view only if instructor
    delete class
  instructors - view only if instructor
    get all
    get one - view only if instructor
    get edit - view only if instructor
    post edit
    get new - view only if instructor
    post new
    delete class


    git add --all
    git commit -m "Added styling"
    git push origin master
