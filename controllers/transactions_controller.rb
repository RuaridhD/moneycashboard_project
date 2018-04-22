require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('../models/merchant.rb')
require_relative('../models/transaction.rb')
require_relative('../models/type.rb')

get '/transactions' do
  @transactions = Transaction.all()
  erb (:"transactions/index")
end
