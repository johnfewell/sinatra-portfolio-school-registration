class InstructorsController < ApplicationController

    #show all instructors
    get '/instructors' do
      if logged_in?
        erb :'/instructors/instructors'
      else
        redirect to '/'
      end
    end

    #create new instructor
    get '/instructors/new' do
      if logged_in? && current_user.id == 9
        erb :'/instructors/new_instructor'
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

    #post route for a new instructor
    post '/instructors/new' do
      if !params[:instructor][:name].empty?
        @instructor = Instructor.create(params[:instructor])
        @instructor.save
        redirect to "/instructors/#{@instructor.slug}"
      else
        redirect to '/instructors/new'
      end
    end

    #edit single instructor
    get '/instructors/:slug/edit' do
      if logged_in? && current_user.id == 9
        #only allow if instructor to edit instructors
        @instructor = Instructor.find_by_slug(params[:slug])
        erb :'/instructors/edit_instructor'
      else
        redirect to '/'
      end
    end

    #post route for an edited instructor
    post '/instructors/:slug' do
      @instructor = Instructor.find_by_slug(params[:slug])
      if params[:instructor][:name].empty?
        redirect to "/instructors/#{@instructor.slug}/edit"
      else
        @instructor.update(params[:instructor])
        @instructor.save
        redirect to "/instructors/#{@instructor.slug}"
      end
    end

    #delete instructor
    get '/instructors/:slug/delete' do
      if logged_in? && current_user.id == 9
        @instructor = Instructor.find_by_slug(params[:slug])
        #check if user is Instructor
          @instructor.delete
          redirect to '/instructors'
      else
        redirect to '/'
      end
    end

end
