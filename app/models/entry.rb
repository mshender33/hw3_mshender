class Entry < ApplicationRecord
  belongs_to :place
  validates :title, presence: true
  validates :content, presence: true  # Ensure content is required
end
