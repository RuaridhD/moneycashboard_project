require_relative('../database/sqlrunner')

class Merchant

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO merchants (name) VALUES ($1) RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM merchants;"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM merchants WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM merchants WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Merchant.new(result.first)
  end

  def update()
    sql = "UPDATE merchants SET name = $1 WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM merchants"
    merchants = SqlRunner.run(sql)
    result = merchants.map {|merchant| Merchant.new(merchant)}
    return result
  end


end
