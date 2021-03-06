require_relative("../db/sql_runner")

class Film

attr_reader :id
attr_accessor :title, :price

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @price = options['price'].to_f
  end


  def save()
    sql = "INSERT INTO films(title) VALUES ('#{ @title }') RETURNING id;"
    user = SqlRunner.run( sql ).first
    @id = user['id'].to_i
  end

  def delete_one
    sql = "DELETE FROM films WHERE id = #{@id}"
    SqlRunner.run(sql)
  end


  def customers_at_film()
    sql "SELECT tickets.* FROM tickets
    INNER JOIN films
    ON film.id = tickets.film_id
    WHERE film_id = #{@id};"
    SqlRunner.run(sql).count
  end


  ###### Class Functions below to perform on ALL THINGS

  def self.find(id)
    sql = "SELECT * FROM films WHERE id = #{@id};"
    result = SqlRunner.run(sql)[0]
    return Film.new(result)
  end

  def self.all()
    sql = "SELECT * FROM films;"
    movies = SqlRunner.run(sql)[0]
    result = movies.map { |movie| Film.new(movie) }
    return result
  end


  def self.delete_all
    sql = "DELETE FROM films;"
    SqlRunner.run(sql)
  end




end