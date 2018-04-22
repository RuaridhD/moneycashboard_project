require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('../models/type.rb')

get '/types' do
  @types = Type.all()
  erb (:"types/index")
end
