require_relative("../db/sql_runner")

class Screening

attr_reader :id
attr_accessor :screening_id, :showing


def initialize(options)
  @id = options['id'].to_i
  @screening_id = options['screening_id'].to_i
  @showing = options['showing']
end

def save()
  sql = "INSERT INTO screenings(screening_id, showing) VALUES (#{ @screening_id }, #{@showing}) RETURNING id;"
  user = SqlRunner.run(sql)[0]
  @id = user['id'].to_i
end

def update()
  sql = "UPDATE screenings SET ( screening_id, showing ) = ( #{@screening_id}, #{@showing} );"
  SqlRunner.run(sql)
end


def delete_one
  sql = "DELETE FROM screenings WHERE id = #{@id}"
  SqlRunner.run(sql)
end


def most_popular()
  sql "SELECT FROM films
  INNER JOIN tickets
  ON customers.id = tickets.customer_id
  WHERE customer_id = #{@id};"
  SqlRunner.run(sql).count
end












end