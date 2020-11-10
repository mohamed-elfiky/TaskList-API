class ListItem < ApplicationRecord
  belongs_to :tlist
  validates :name, :status, presence: true
end
