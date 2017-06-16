class CoursesController < ApplicationController

  #show all courses
  get '/courses' do
    erb :'/courses/index'
  end

  get '/courses/:slug' do
    erb :'/courses/'
  end

end
