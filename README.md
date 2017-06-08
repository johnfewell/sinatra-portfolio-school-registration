# sinatra-portfolio-school-registration
This is my Learn.co Sinatra portfolio project.

#Overview

This app allows the tracking of classes, students, and instructors.

#Classes

You can view all the classes now offered by the school and you can view the students in a class. Also, you can view which instructors is assigned to teach which class.

#Instructors

You can view all of the instructors employed by the school, and you can view all the classes taught by a particular instructor. In addition, you can view all of the students taught by a particular instructor.

#Students

You can view all of the students at the school.

#For my reference

models
  Students have many classes, have many instructors. Have secure passwords
  Instructors have many classes, have many students through classes. Have secure passwords
  Classes have many students, have many instructors

db
  students have names, emails, instructors_id
  instructors have name, emails, students through classes
  classes have title, start date, end date, weeks, semester, year, students_id

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
