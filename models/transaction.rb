require_relative('../database/sqlrunner')
require_relative('../models/merchant.rb')
require_relative('../models/type.rb')

class Transaction

  attr_reader :id, :merchant_id, :type_id
  attr_accessor :cost, :date

  def initialize(options)
    @id = options['id'].to_i
    @merchant_id = options['merchant_id'].to_i
    @type_id = options['type_id'].to_i
    @cost = options['cost']
    @date = options['date']
  end

  def save()
    sql = "INSERT INTO transactions (merchant_id, type_id, cost, date) VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@merchant_id, @type_id, @cost, @date]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM transactions;"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM transactions WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM transactions WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Transaction.new(result.first)
  end

  def update()
    sql = "UPDATE transactions SET (merchant_id, type_id, cost, date) = ($1, $2, $3, $4) WHERE id = $5"
    values = [@merchant_id, @type_id, @cost, @date, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM transactions"
    transactions = SqlRunner.run(sql)
    result = transactions.map {|transaction| Transaction.new(transaction)}
    return result
  end

  def type()
    sql = "SELECT * FROM types WHERE id = $1"
    values = [@type_id]
    results = SqlRunner.run(sql, values)
    return Type.new(results.first)
  end

  def merchant()
    sql = "SELECT * FROM merchants WHERE id = $1"
    values = [@merchant_id]
    results = SqlRunner.run(sql, values)
    return Merchant.new(results.first)
  end

  def self.count()
    sql = "SELECT SUM(cost) FROM transactions"
    return SqlRunner.run(sql)[0]['sum'].to_f
  end

  def self.count_by_id
    sql = "SELECT types.type, sum(cost) FROM transactions INNER JOIN types ON transactions.type_id = types.id GROUP BY types.type;"
    result = SqlRunner.run(sql)
  end

end
