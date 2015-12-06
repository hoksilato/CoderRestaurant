class Dish < ActiveRecord::Base
  belongs_to :menu
  paginates_per 9

  validates :name, presence: true,
                    length: { minimum: 5 },
                    uniqueness: true
  validates :price, presence: true
  validates_numericality_of :price, :greater_than => 0

  validates_associated :menu

  validates_each :name do |record, attr, value|
    record.errors.add(attr, 'must start with upper case') if value =~ /\A[[:lower:]]/
  end
end
