require_relative( "../models/merchant.rb" )
require_relative( "../models/transaction.rb" )
require_relative( "../models/type.rb" )
require("pry-byebug")

Merchant.delete_all()
Transaction.delete_all()
Type.delete_all()


merchant1 = Merchant.new({
  "name" => "Tesco"
})

merchant1.save()

type1 = Type.new({
  "type" => "Groceries"
})

type1.save()

transaction1 = Transaction.new({
  "merchant_id" => merchant1.id,
  "type_id" => type1.id,
  "cost" => 29.50,
  "date" => "22/04/18"
})

transaction1.save()



binding.pry
nil
