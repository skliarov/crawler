class WebPage < ApplicationRecord
  # Callbacks
  
  # Constants
  
  # Relationships
  has_many :content_records, dependent: :destroy
  
  # Relationships validations
  
  # Field validations
  validates :url, presence: true
end
