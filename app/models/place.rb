class Place < ApplicationRecord
  has_many :entries, dependent: :destroy
  accepts_nested_attributes_for :entries  # Allows creating entries alongside places
  validates :name, presence: true
end
