class Order < ActiveRecord::Base
  has_many :order_items, dependent: :destroy

	validates :customer_name, presence: true,
                    length: { minimum: 5 }
  validates :phone, presence: true,
                    length: { minimum: 10 }
  validates :address, presence: true,
                      length: { minimum: 5 }
end
