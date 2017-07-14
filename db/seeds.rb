require_relative( '../models/customer')
require_relative( '../models/film')
require_relative( '../models/ticket')

require ( 'pry-byebug')

Customer.delete_all()
Film.delete_all()
Ticket.delete_all()

customer1 = Customer.new({'name' => 'Andrew Weir', 'funds' => 100})
customer1.save()

film1 = Film.new({'title' => 'Dead Mans shoes', 'price' => 20})
film1.save()

ticket1 = Ticket.new({'customer_id' =>  1, 'film_id' => 2})

binding.pry

nil