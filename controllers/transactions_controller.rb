require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('../models/merchant.rb')
require_relative('../models/transaction.rb')
require_relative('../models/type.rb')

get '/transactions' do
  @transactions = Transaction.all()
  @count = Transaction.count()
  @types = Type.all()
  @total_by_tag = Transaction.count_by_id()
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

get '/transactions/:id' do
  @transaction = Transaction.find(params['id'].to_i)
  erb(:"transactions/show")
end

post '/transactions/:id/delete' do
  Transaction.delete(params[:id])
  redirect to("/transactions")
end

get "/transactions/:id/edit" do
  @merchants = Merchant.all()
  @types = Type.all()
  @transaction = Transaction.find(params[:id])
  erb(:"transactions/edit")
  end

post "/transactions/:id/update" do
  txn = Transaction.new(params)
  txn.update()
  redirect to "/transactions"
end
