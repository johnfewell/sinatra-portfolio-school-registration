class InstructorsController < ApplicationController

    #show all instructors
    get '/instructors' do
      if logged_in?
        erb :'/instructors/instructors'
      else
        flash[:message] = "Please log in first."
        redirect to '/'
      end
    end

    #create new instructor
    get '/instructors/new' do
    if logged_in? && is_admin?
        erb :'/instructors/new_instructor'
      else
        flash[:message] = "You aren't allowed to do that."
        redirect to '/'
      end
    end

    #show single instructors
    get '/instructors/:slug' do
      if logged_in?
        @instructor = Instructor.find_by_slug(params[:slug])
        erb :'/instructors/show_instructor'
      else
        flash[:message] = "Please log in first."
        redirect to '/'
      end
    end

    #post route for a new instructor
    post '/instructors/new' do
      if !params[:instructor][:name].empty?
        @instructor = Instructor.create(params[:instructor])
        @instructor.save
        flash[:message] = "#{@instructor.name} created."
        redirect to "/instructors/#{@instructor.slug}"
      else
        flash[:message] = "Instructors require a name."
        redirect to '/instructors/new'
      end
    end

    #edit single instructor
    get '/instructors/:slug/edit' do
    if logged_in? && is_admin?
        #only allow if instructor to edit instructors
        @instructor = Instructor.find_by_slug(params[:slug])
        erb :'/instructors/edit_instructor'
      else
        flash[:message] = "You aren't allowed to do that."
        redirect to '/'
      end
    end

    #post route for an edited instructor
    post '/instructors/:slug' do
      @instructor = Instructor.find_by_slug(params[:slug])
      if params[:instructor][:name].empty?
        flash[:message] = "Instructors require a name."
        redirect to "/instructors/#{@instructor.slug}/edit"
      else
        @instructor.update(params[:instructor])
        @instructor.save
        flash[:message] = "#{@instructor.name} edited."
        redirect to "/instructors/#{@instructor.slug}"
      end
    end

    #delete instructor
    get '/instructors/:slug/delete' do
    if logged_in? && is_admin?
        @instructor = Instructor.find_by_slug(params[:slug])
        flash[:message] = "#{@instructor.name} deleted."
        @instructor.delete
        redirect to '/instructors'
      else
        flash[:message] = "You aren't allowed to do that."
        redirect to '/'
      end
    end

end
