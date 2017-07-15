require_relative("../db/sql_runner")

class Screening

attr_reader :id
attr_accessor :screening_id, :showing


def initialize(options)
  @id = options['id'].to_i
  @screening_id = options['screening_id'].to_i
  @showing = options['showing']
end














end