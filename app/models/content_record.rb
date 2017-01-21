class ContentRecord < ApplicationRecord
  # Callbacks
  
  # Constants
  CONTENT_KINDS = ['h1', 'h2', 'h3', 'a']
  
  # Relationships
  belongs_to :web_page
  
  # Relationships validations
  validates :web_page, presence: true
  
  # Field validations
  validates :content, presence: true
  validates :kind, presence: true, inclusion: { in: ContentRecord::CONTENT_KINDS }
end
