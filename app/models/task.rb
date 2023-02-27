class Task < ApplicationRecord
  belongs_to :category, optional: true
  validates :name, :position, :category, :description, presence: true
end
