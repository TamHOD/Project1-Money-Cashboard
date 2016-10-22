require '../models/tag'

@tag1 = Tag.new('name' => 'food', 'color' => 'green', 'description' => 'Total food budget', 'budget' => 200)
@tag1.save