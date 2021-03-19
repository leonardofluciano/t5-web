class Customer < ApplicationRecord
    has_and_belongs_to_many :subsidiaries
    has_one :account, dependent: :destroy

    validates :name, length: { maximum: 191 }, presence: true
    validates :surname, length: { maximum: 191 }, presence: true
    validates :document, length: { is: 11 }, document: { type: 'cpf' }, uniqueness: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, length: { maximum: 191 }
    validates :phone, length: { is: 11 }
end