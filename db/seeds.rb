# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

dishes = [
	'Cơm tấm', 'Bánh mì thịt nướng', 'Bánh ướt', 'Bánh bao', 'Bánh mì thịt chả',
	'Hủ tiếu bò viên', 'Cơm chiên dương châu', 'Bánh mì bò kho', 'Hủ tiếu nam vang', 'Bánh cuốn',
	'Phở bò', 'Phở gà', 'Hủ tiếu bò kho', 'Bánh xèo', 'Bánh khọt',
	'Cà phê đen', 'Cà phê sữa', 'Đá chanh', 'Trà đá', 'Nước cam'
]

Dish.destroy_all

menu_id = 0
dishes.each.with_index do |value, index|
  if index % 5 == 0
    menu_id += 1
  end
  Dish.create(
      name: value,
      description: Faker::Lorem.paragraph,
      price: Faker::Number.decimal(2),
      image_url: 'http://loremflickr.com/262/180/' + Faker::Lorem.word,
      menu_id: menu_id
    )
end
