class Account < ApplicationRecord
    belongs_to :customer

    validates :number, length: { is: 12 }, numericality: { only_integer: true, greater_than: 0 }
    validates :balance, length: { maximum: 191 }, numericality: { greater_than_or_equal: 0 }
end
