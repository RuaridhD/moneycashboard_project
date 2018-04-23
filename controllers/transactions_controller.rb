require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('../models/merchant.rb')
require_relative('../models/transaction.rb')
require_relative('../models/type.rb')

get '/transactions' do
  @transactions = Transaction.all()
  @count = Transaction.count()
  erb (:"transactions/index")
end

get '/transactions/new' do
  @transactions = Transaction.all()
  @merchants = Merchant.all()
  @types = Type.all()
  erb(:"transactions/new")
end

post '/transactions' do
  transaction = Transaction.new(params)
  transaction.save()
  redirect to("/transactions")
end
