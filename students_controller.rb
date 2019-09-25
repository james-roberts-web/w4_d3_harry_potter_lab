require('sinatra')
require('sinatra/reloader')
require_relative('models/student')
require_relative('models/house')
also_reload('./models/*')

get '/' do
  @students = Student.all
  erb(:index)
end

# index
get '/students' do
  @students = Student.all
  erb(:index)
end

# new
get '/students/new' do
  @houses = House.all
  erb(:new)
end

# show
get '/students/:id' do
  @students = Student.find(params[:id])
  erb(:show)
end

# create
post '/students' do
  Student.new(params).save
  redirect'/students'
end

# edit
get '/students/:id/edit' do
  @houses = House.all
  @students = Student.find(params[:id])
  erb(:edit)
end

# update
put '/students/:id' do
  Student.new(params).update
  redirect '/students'
end

# destroy
delete '/students/:id' do
  destructed = Student.find(params[:id])
  destructed.delete
  redirect '/students'
end
