require '../models/tag'

Tag.delete_all

@tag1 = Tag.new('name' => 'food', 'color' => 'green', 'description' => 'Total food budget', 'budget' => 200)
@tag1.save



