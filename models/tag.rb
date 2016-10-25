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

  def transactions
    sql = "SELECT transactions.* FROM transactions
            INNER JOIN taggings ON
              transactions.id = taggings.transaction_id
                INNER JOIN tags ON
                  taggings.tag_id = tags.id 
                    WHERE tags.id = #{@id}"
    return Transaction.map_items( sql )
  end

  def spent
    spent = 0
    transactions.each {|transaction| spent += transaction.amount }
    return sprintf('%.2f', spent)
  end  

  def budget_2f_s
    return sprintf('%.2f', @budget)
  end

  def self.update( params )
    sql = "UPDATE tags SET
      name = '#{params['name']}',
      description = '#{params['description']}',
      color = '#{params['color']}',
      budget = #{params['budget']}
    WHERE 
      id = #{params['id']}"
    SqlRunner.run( sql )
  end


  def self.find( id )
    sql = "SELECT * FROM tags WHERE id = #{id}"
    return map_item( sql )
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
    sql = "DELETE FROM tags"
    SqlRunner.run( sql )
  end

  def self.delete( id )
    sql = "DELETE FROM tags
            WHERE id = #{id}"
    SqlRunner.run( sql )
  end



end