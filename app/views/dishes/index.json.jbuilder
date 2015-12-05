json.array!(@dishes) do |dish|
  json.extract! dish, :id, :name, :description, :price, :image_url, :views, :menu_id
  json.url dish_url(dish, format: :json)
end
