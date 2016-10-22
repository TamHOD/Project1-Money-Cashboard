require_relative '../db/sql_runner'

class Tag

  attr_reader :id, :name, :color, :description, :budget

  def initialize( params )
    @id = params['id'].to_i if params['id']
    @name = params['name']
    @color = params['color']
    @description = params['description']
    @budget = params['budget'].to_f
  end

  def save
    sql = "INSERT into tags(
        name,
        color,
        description,
        budget
      )
      VALUES(
        '#{@name}',
        '#{@color}',
        '#{@description}',
         #{@budget}
      )
      RETURNING *
      "
    tag = Tag.map_item( sql ) 
    @id = tag.id.to_i
  end

  def self.find 

  end

  def self.all 
    sql = "SELECT * from tags"
    return Tag.map_items( sql )
  end

  def self.map_items( sql )
    results_data = SqlRunner.run( sql )
    return results_data.map {|result| Tag.new( result )}
  end

  def self.map_item( sql )
    return Tag.map_items( sql ).first
  end

  def self.delete_all
    sql = "DELETE from tags"
    SqlRunner.run( sql )
  end



end