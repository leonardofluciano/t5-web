class Subsidiary < ApplicationRecord
    belongs_to :company
    has_and_belongs_to_many :customers

    validates :name, length: { maximum: 191 }
    validates :legal_name, length: { maximum: 191 }
    validates :document, length: { is: 14 }, document: { type: 'cnpj' }, uniqueness: true
end
