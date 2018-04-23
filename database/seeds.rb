require_relative( "../models/merchant.rb" )
require_relative( "../models/transaction.rb" )
require_relative( "../models/type.rb" )
require("pry-byebug")

Merchant.delete_all()
Type.delete_all()
Transaction.delete_all()


merchant1 = Merchant.new({
  "name" => "Tesco"
})

merchant1.save()

merchant2 = Merchant.new({
  "name" => "Aldi"
})

merchant2.save()

merchant3 = Merchant.new({
  "name" => "Asda"
})

merchant3.save()

merchant4 = Merchant.new({
  "name" => "Greggs"
})

merchant4.save()

merchant5 = Merchant.new({
  "name" => "Boots"
})

merchant5.save()

merchant6 = Merchant.new({
  "name" => "KFC"
})

merchant6.save()

merchant7 = Merchant.new({
  "name" => "Burger King"
})

merchant7.save()

merchant8 = Merchant.new({
  "name" => "McDonalds"
})

merchant8.save()

merchant9 = Merchant.new({
  "name" => "Next"
})

merchant9.save()

merchant10 = Merchant.new({
  "name" => "Subway"
})

merchant10.save()

type1 = Type.new({
  "type" => "Groceries"
})

type1.save()

type2 = Type.new({
  "type" => "Clothes"
})

type2.save()

type3 = Type.new({
  "type" => "Recreational"
})

type3.save()

type4 = Type.new({
  "type" => "Fast Food"
})

type4.save()

type5 = Type.new({
  "type" => "Petrol"
})

type5.save()

type6 = Type.new({
  "type" => "Miscellaneous"
})

type6.save()



transaction1 = Transaction.new({
  "merchant_id" => merchant1.id,
  "type_id" => type1.id,
  "cost" => 29.50,
  "date" => "2018/03/20"
})

transaction1.save()

#
#
# binding.pry
# nil
