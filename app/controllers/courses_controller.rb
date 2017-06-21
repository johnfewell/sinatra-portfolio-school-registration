class CoursesController < ApplicationController

  #show all courses
  get '/courses' do

    if logged_in?
      binding.pry
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

  #create new course
  get '/courses/new' do
    if logged_in? && current_user.id == 9
      erb :'/courses/new_course'
    else
      redirect to '/'
    end
  end

  #post route for a new course
  post '/courses/new' do
    if !params[:course][:title].empty?
      @course = Course.create(params[:course])
      @course.save
      redirect to "/courses/#{@course.slug}"
    else
      redirect to '/courses/new'
    end
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
    if logged_in? && current_user.id == 9
      @course = Course.find_by_slug(params[:slug])
      erb :'/courses/edit_course'
    else
      redirect to '/'
    end
  end

  #post route for an edited course
  post '/courses/:slug' do
    @course = Course.find_by_slug(params[:slug])
    if params[:course][:title].empty?
      redirect to "/courses/#{@course.slug}/edit"
    else

      @course.update(params[:course])
      @course.save
      redirect to "/courses/#{@course.slug}"
    end
  end

  #delete course
  get '/courses/:slug/delete' do
    if logged_in? && current_user.id == 9
      @course = Course.find_by_slug(params[:slug])
      @course.delete
      redirect to '/courses'
    else
      redirect to '/'
    end
  end

end
