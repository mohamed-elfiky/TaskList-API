class Tlist < ApplicationRecord
    has_many :list_items, dependent: :destroy
    validates :name, :owner, presence: true
end
