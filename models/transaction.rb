require_relative('../database/sqlrunner')

class Transaction

  attr_reader :id
  attr_accessor :merchant_id, :type_id, :cost, :date

  def initialize(options)
    @id = options['id'].to_i
    @merchant_id = options['merchant_id'].to_i
    @type_id = options['type_id'].to_i
    @cost = options['cost']
    @date = options['date']
  end

  def save()
    sql = "INSERT INTO transactions (merchant_id, type_id, cost, date) VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@merchant_id, @transaction_id, @cost, @date]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM transactions;"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM transactions WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

end
