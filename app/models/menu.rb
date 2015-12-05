class Menu < ActiveRecord::Base
	validates :name, presence: true,
                    length: { minimum: 5 },
                    format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" },
                    uniqueness: true

  validates_each :name do |record, attr, value|
    record.errors.add(attr, 'must start with upper case') if value =~ /\A[[:lower:]]/
  end
end
