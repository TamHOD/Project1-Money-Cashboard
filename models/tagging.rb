class Tagging


  attr_reader :tag_id, :transaction_id

  def initialize( params )
    @tag_id = params['tag_id'].to_i
    @transaction_id = params['transaction_id'].to_i

  end

  def save
    sql = "INSERT INTO taggings(
      tag_id,
      transaction_id
      )
    VALUES (
      #{@tag_id},
      #{@transaction_id}
      )"
    SqlRunner.run(sql)
  end

  def self.extract_from_params( params )

    transaction = Transaction.new( params )
    transaction_id = transaction.save.id
    
    params.each_pair do |key, value|
      if value == "on" and key[0..6] == "tag_id_"
        tag_id = key.split("tag_id_")[1].to_i
        tagging = Tagging.new('tag_id' => tag_id, 'transaction_id' => transaction_id)
        tagging.save
      end
    end 
  end

  # def self.delete_all
  #   sql = "DELETE from taggings"
  #   SqlRunner.run( sql )
  # end


end
