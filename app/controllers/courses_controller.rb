class CoursesController < ApplicationController

  #show all courses
  get '/courses' do

    if logged_in?
      erb :'/courses/courses'
    else
      flash[:message] = "Please log in first."
      redirect to '/'
    end
  end

  post '/courses' do
    @user = Student.find(session[:user_id])
    @user.update(params[:student])
    @user.save
    flash[:message] = "Successfully updated your registration."
    redirect to '/'
  end

  #create new course
  get '/courses/new' do
    if logged_in? && is_admin?
      erb :'/courses/new_course'
    else
      flash[:message] = "You aren't allowed to do that."
      redirect to '/'
    end
  end

  #post route for a new course
  post '/courses/new' do
    if !params[:course][:title].empty?
      @course = Course.create(params[:course])
      @course.save
      flash[:message] = "#{@course.title} created."
      redirect to "/courses/#{@course.slug}"
    else
      flash[:message] = "Courses require a name."
      redirect to '/courses/new'
    end
  end

  #show single courses
  get '/courses/:slug' do
    if logged_in?
      @course = Course.find_by_slug(params[:slug])
      erb :'/courses/show_course'
    else
      flash[:message] = "You aren't allowed to view that."
      redirect to '/'
    end
  end

  #edit single course
  get '/courses/:slug/edit' do
    if logged_in? && is_admin?
      @course = Course.find_by_slug(params[:slug])
      erb :'/courses/edit_course'
    else
      flash[:message] = "You aren't allowed to do that."
      redirect to '/'
    end
  end

  #post route for an edited course
  post '/courses/:slug' do
    @course = Course.find_by_slug(params[:slug])
    if params[:course][:title].empty?
      flash[:message] = "Courses require a name."
      redirect to "/courses/#{@course.slug}/edit"
    else
      @course.update(params[:course])
      @course.save
      flash[:message] = "#{@course.title} successfully edited."
      redirect to "/courses/#{@course.slug}"
    end
  end

  #delete course
  get '/courses/:slug/delete' do
    if logged_in? && is_admin?
      @course = Course.find_by_slug(params[:slug])
      flash[:message] = "#{@course.title} deleted."
      @course.delete
      redirect to '/courses'
    else
      flash[:message] = "You aren't allowed to do that."
      redirect to '/'
    end
  end

end
