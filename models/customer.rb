require_relative("../db/sql_runner")

class Customer

attr_reader :id
attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @funds = options['funds'].to_f
  end


  def save()
    sql = "INSERT INTO customers(name, funds) VALUES ('#{ @name }', #{@funds}) RETURNING id;"
    user = SqlRunner.run(sql)[0]
    @id = user['id'].to_i
  end

  def update()
    sql = "UPDATE customers SET (name, funds) = ( '#{@name}', #{@funds} )"
    SqlRunner.run(sql)
  end


  def delete_one
    sql = "DELETE FROM customers WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def buy_ticket(film)
    @funds -= film.price
    update()
  end

  def how_many_tickets()
    sql "SELECT customers.* FROM customers
    INNER JOIN tickets
    ON customers.id = tickets.customer_id
    WHERE customer_id = #{@id};"
    SqlRunner.run(sql).count
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