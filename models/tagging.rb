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

  def self.extract_from_params( params, transaction_id )
    

    params.each_pair do |key, value|
      if value == "on" and key[0..6] == "tag_id_"
        tag_id = key.split("tag_id_")[1].to_i
        tagging = Tagging.new('tag_id' => tag_id, 'transaction_id' => transaction_id) 
        tagging.save if Transaction.find( transaction_id ).has_tag?( tag_id ) == false
      end      
    end 

    Transaction.find( transaction_id ).tags.each do |db_tag|
      find_key = "tag_id_" + db_tag.id.to_s
      if params.has_key?(find_key) == false
        Tagging.delete( db_tag.id, transaction_id )
      end
    end

      
  end

  def self.delete( tag_id, transaction_id )
  
    sql = "DELETE from taggings WHERE
      tag_id = #{tag_id} AND transaction_id = #{transaction_id}"
    SqlRunner.run( sql )
  end


end
