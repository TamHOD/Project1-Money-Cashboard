require '../models/tag'

Tag.delete_all

@tag1 = Tag.new('name' => 'food', 'color' => 'lightblue', 'description' => 'Total food budget', 'budget' => 200)
@tag1.save



