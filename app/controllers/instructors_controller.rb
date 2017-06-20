class InstructorsController < ApplicationController

    #show all instructors
    get '/instructors' do
      if logged_in?
        erb :'/instructors/instructors'
      else
        redirect to '/'
      end
    end

    #show single instructors
    get '/instructors/:slug' do
      if logged_in?
        @instructor = Instructor.find_by_slug(params[:slug])
        erb :'/instructors/show_instructor'
      else
        redirect to '/'
      end
    end

    #edit single instructor
    get '/instructors/:slug/edit' do
      if logged_in?
        #only allow if instructor to edit instructors
        @instructor = Instructor.find_by_slug(params[:slug])
        erb :'/instructors/edit_instructor'
      else
        redirect to '/'
      end
    end

    #create new instructor
    get '/instructors/new' do
      if logged_in?
        erb :'/instructors/new_instructor'
      else
        redirect to '/'
      end
    end

    #post route for an edited instructor
    post '/instructors/:slug/' do
      @instructor = Instructor.find_by_slug(params[:slug])
      if params[:title].empty?
        redirect to "/instructors/#{@instructor.slug}/edit"
      else
        @instructor.update(params[:instructor])
        @instructor.save
      end
    end

    #post route for a new instructor
    post '/instructors' do
      if !params[:title].empty?
        Instructor.create(params[:instructor])
      else
        redirect to '/instructors/new'
      end
    end

    #delete instructor
    get '/tweets/:slug/delete' do
      if logged_in?
        @instructor = Instructor.find_by_slug(params[:slug])
        #check if user is Instructor
          @instructor.delete
          redirect to '/instructors'
      else
        redirect to '/'
      end
    end

end
