class CoursesController < ApplicationController

  #show all courses
  get '/courses' do

    if logged_in?
        #i really need to get rid of this
      if Student.find(session[:user_id])
        @stu_user = Student.find(session[:user_id])
      else
        @inst_user = Instructor.find(session[:user_id])
      end

      erb :'/courses/courses'
    else
      redirect to '/'
    end
  end

  post '/courses' do
    @user = Student.find(session[:user_id])
    @user.update(params[:student])
    @user.save
    redirect to '/'
  end

  #show single courses
  get '/courses/:slug' do
    if logged_in?
      @course = Course.find_by_slug(params[:slug])
      erb :'/courses/show_course'
    else
      redirect to '/'
    end
  end

  #edit single course
  get '/courses/:slug/edit' do
    if logged_in?
      #only allow if instructor to edit courses
      @course = Course.find_by_slug(params[:slug])
      erb :'/courses/edit_course'
    else
      redirect to '/'
    end
  end

  #create new course
  get '/courses/new' do
    if logged_in?
      erb :'/courses/new_course'
    else
      redirect to '/'
    end
  end

  #post route for an edited course
  post '/courses/:slug/' do
    @course = Course.find_by_slug(params[:slug])
    if params[:title].empty?
      redirect to "/courses/#{@course.slug}/edit"
    else
      @course.update(params[:course])
      @course.save
    end
  end

  #post route for a new course
  post '/courses' do
    if !params[:title].empty?
      Course.create(params[:course])
    else
      redirect to '/courses/new'
    end
  end

  #delete course
  get '/tweets/:slug/delete' do
    if logged_in?
      @course = Course.find_by_slug(params[:slug])
      #check if user is Instructor
        @course.delete
        redirect to '/courses'
    else
      redirect to '/'
    end
  end

end
