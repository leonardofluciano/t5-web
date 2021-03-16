class Company < ApplicationRecord
    has_many :subsidiaries, dependent: :destroy

    validates :name, length: { maximum: 191 }
    validates :legal_name, length: { maximum: 191 }
    validates :document, length: { is: 14 }, document: { type: 'cnpj' }, uniqueness: true
end
