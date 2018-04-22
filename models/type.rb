require_relative('../database/sqlrunner')

class Type

  attr_reader :id
  attr_accessor :type

  def initialize(options)
    @id = options['id'].to_i
    @type = options['type']
  end

  def save()
    sql = "INSERT INTO types (type) VALUES ($1) RETURNING id"
    values = [@type]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM types;"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM types WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

end
