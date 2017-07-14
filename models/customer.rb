require_relative("../db/sql_runner")

class Customers

attr_reader :id
attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @funds = options['funds'].to_f
  end


  def save()
    sql = "INSERT INTO customers(name) VALUES ('#{ @name }' RETURNING id;"
    user = SqlRunner.run(sql)[0]
    @id = user['id'].to_i
  end

  def delete_one
    sql = "DELETE FROM customers WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def buy_ticket
    sql = "UPDATE customers SET (name, funds) = ( #{funds} ) WHERE id = #{@id}"
    SqlRunner.run(sql)
  end


 ##### Class Functions Below to perform on ALL THINGS


  def self.find(id)
    sql = "SELECT * FROM customers WHERE id = #{@id}"
    result = SqlRunner.run(sql)[0]
    return Customer.new(result)
  end

  def self.all()
    sql = "SELECT * FROM customers;"
    users = SqlRunner.run( sql )[0]
    result = users.map { |user| Customer.new( user) }
    return result
  end

  def self.delete_all
    sql = "DELETE FROM customers;"
    SqlRunner.run(sql)
  end




end