class Customer < ApplicationRecord
    has_and_belongs_to_many :subsidiaries
    has_one :account, dependent: :destroy

    validates :name, length: { maximum: 191 }
    validates :surname, length: { maximum: 191 }
    validates :document, length: { minimum: 11, maximum: 14 }, document: { type: 'any' }, uniqueness: true
end