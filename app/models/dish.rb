class Dish < ActiveRecord::Base
  belongs_to :menu
  paginates_per 9
end
