require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('../models/type.rb')

get '/types' do
  @transactions = Transaction.all()
  @count = Transaction.count()
  @types = Type.all()
  @total_by_tag = Transaction.count_by_id()
  erb (:"types/index")
end
