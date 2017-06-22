class StudentsController < ApplicationController

  #show all students
  get '/students' do
    if logged_in?
      erb :'/students/students'
    else
      flash[:message] = "Please log in first."
      redirect to '/'
    end
  end

  #create new student
  get '/students/new' do
    if logged_in? && is_admin?
      erb :'/students/new_student'
    else
      flash[:message] = "You aren't allowed to do that."
      redirect to '/'
    end
  end

  #post route for a new student
  post '/students/new' do
    if !params[:student][:name].empty?
      @student = Student.create(params[:student])
      @student.save
      flash[:message] = "#{@student.name} created."
      redirect to "/students/#{@student.slug}"
    else
      flash[:message] = "Students require a name."
      redirect to '/students/new'
    end
  end

  #show single students
  get '/students/:slug' do
    if logged_in?
      @student = Student.find_by_slug(params[:slug])
      erb :'/students/show_student'
    else
      flash[:message] = "Please log in first."
      redirect to '/'
    end
  end

  #post route for an edited student
  post '/students/:slug' do
    @student = Student.find_by_slug(params[:slug])
    if params[:student][:name].empty?
      flash[:message] = "Students require a name."
      redirect to "/students/#{@student.slug}/edit"
    else
      @student.update(params[:student])
      @student.save
      flash[:message] = "#{@student.name} edited."
      redirect to "/students/#{@student.slug}"
    end
  end

  #edit single student
  get '/students/:slug/edit' do
    if logged_in?
      @student = Student.find_by_slug(params[:slug])
      if @student.id == current_user.id
        erb :'/students/edit_student'
      elsif is_admin?
          erb :'/students/edit_student'
      else
        flash[:message] = "You aren't allowed to do that."
        redirect to '/students'
      end
    else
      flash[:message] = "Please log in first."
      redirect to '/'
    end
  end

  #delete student
  get '/students/:id/delete' do
    if logged_in? && is_admin?
      @student = Student.find_by_slug(params[:id])
      flash[:message] = "#{@student.name} deleted."
      @student.delete
      redirect to '/students'
    else
      flash[:message] = "You aren't allowed to do that."
      redirect to '/'
    end
  end
end
