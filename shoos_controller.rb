require('sinatra')
require('sinatra/contrib/all') if development?
require('pry-byebug')
require_relative('./models/shoos.rb')

get '/shoos/new' do
  erb(:new)
end

get '/shoos/orders' do
  @shoos = Shoo.all()
  # binding.pry
  erb(:index)
end

post '/shoos' do
  # binding.pry
  @shoo = Shoo.new(params)
  @shoo.save()
  erb(:create)
end
