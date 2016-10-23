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


end
