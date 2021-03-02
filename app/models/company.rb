class Company < ApplicationRecord
    has_many :subsidiaries, dependent: :destroy
end
