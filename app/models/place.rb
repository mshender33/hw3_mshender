class Place < ApplicationRecord
  # talks to the "places" table
end

class Place < ApplicationRecord
  has_many :entries, dependent: :destroy
  validates :name, presence: true
end
