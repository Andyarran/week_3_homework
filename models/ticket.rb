require_relative("../db/sql_runner")

class Ticket

attr_reader :id
attr_accessor :customer_id, :film_id

def initialize(options)
  @id = options['id']
  @customer_id = options['customer_id'].to_i
  @film_id = options['film_id'].to_i
end





def save()
  sql = "INSERT INTO customers(customer_id, film_id) VALUES (#{@customer_id}, #{@film_id}) RETURNING id;"
  ticket = SqlRunner.run(sql)
  @id = ticket['id'].to_i
end


def customer()
  sql = "SELECT * FROM customers WHERE id = #{@user_id};"
  customer = SqlRunner.run(sql)[0]
  return Customers.new(customer)
end

def film()
  sql = "SELECT * FROM films WHERE id = #{@film_id};"
  film = SqlRunner.run(sql)[0]
  return Films.new(film)
end




def customers_and_film
sql = "SELECT customers.* FROM customers
INNER JOIN tickets
ON customers.id = tickets.customer_id
WHERE customer_id = #{@id};"
SqlRunner.run(sql)
end

##### Class Functions involving all stuff




def self.all()
  sql = "SELECT * FROM tickets;"
  tickets = SqlRunner.run(sql)
  result = tickets.map { |ticket| Ticket.new(tickets)}
  return result
end

def self.delete_all
  sql = "DELETE from tickets;"
  SqlRunner.run(sql)
end





end