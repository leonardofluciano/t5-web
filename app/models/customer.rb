class Customer < ApplicationRecord
    has_and_belongs_to_many :subsidiaries
    has_one :account, dependent: :destroy
end