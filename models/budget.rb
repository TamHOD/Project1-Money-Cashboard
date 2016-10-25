require_relative '../db/sql_runner'

class Budget

  attr_reader :id, :name, :amount

  def initialize( params )
    @id = params['id'].to_i if params['id']
    @name = params['name']
    @amount = params['amount'].to_f
   
  end

  def save
    sql = "INSERT into budgets(
        name,
        amount
      )
      VALUES(
        '#{@name}',
         #{@amount}
      )
      RETURNING *
      "
    budget = Budget.map_item( sql ) 
    @id = budget.id.to_i
  end

  def transactions
    sql = "SELECT transactions.* FROM transactions
            INNER JOIN budgets ON
              transactions.budget_id = budgets.id
                WHERE budgets.id = #{@id}"
    return Transaction.map_items( sql )
  end

  def spent
    return Helper.total_to_2dp( transactions, "amount" )
  end  


  def self.update( params )
    sql = "UPDATE budgets SET
      name = '#{params['name']}',
      amount = #{params['amount']}
    WHERE 
      id = #{params['id']}"
    SqlRunner.run( sql )
  end


  def self.find( id )
    sql = "SELECT * FROM budgets WHERE id = #{id}"
    return map_item( sql )
  end

  def self.all 
    sql = "SELECT * from budgets"
    return Budget.map_items( sql )
  end

  def self.map_items( sql )
    results_data = SqlRunner.run( sql )
    return results_data.map {|result| Budget.new( result )}
  end

  def self.map_item( sql )
    return Budget.map_items( sql ).first
  end

  def self.delete_all
    sql = "DELETE FROM budgets"
    SqlRunner.run( sql )
  end

  def self.delete( id )
    sql = "DELETE FROM budgets
            WHERE id = #{id}"
    SqlRunner.run( sql )
  end

  def self.total_budget
    return Helper.total_to_2dp( Budget.all, "amount" )
  end



end