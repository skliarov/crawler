require 'net/http'

class WebPage < ApplicationRecord
  # Callbacks
  after_validation :crawl_web_page
  
  # Constants
  
  # Relationships
  has_many :content_records, autosave: true, dependent: :destroy
  
  # Relationships validations
  
  # Field validations
  validates :url, presence: true, format: { with: /(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,8}(:[0-9]{1,5})?(\/.*)?/, message: "URL must be in format: https://www.google.com" }
  
  private
    def crawl_web_page
      if Rails.env.test?
        logger.warn "Crawling of web pages is disabled for test environment"
        return
      end
      
      unless self.errors.empty?
        return
      end
      
      logger.info "Crawling web page: #{self.url}"
      
      # Init URI
      uri = URI(self.url)
      if uri.nil?
        # Add error
        error_message = "Invalid URI #{self.url}"
        self.errors.add(:base, error_message)
        # Log invalid URI
        logger.error(error_message)
        return
      end
      
      # Perform request
      response = Net::HTTP.get_response(uri)
      if response.code != '200'
        # Add error
        error_message = "Server responded with code #{response.code} for GET #{self.url}"
        self.errors.add(:base, error_message)
        # Log invalid URI
        logger.error(error_message)
        return
      end
      
      dom = Nokogiri::HTML(response.body)
      
      # Crawl h1 tags
      h1_tags = dom.css('h1')
      h1_tags.each do |h1_tag|
        content = h1_tag.text.to_s
        if content && content.strip.length > 0
          self.content_records << ContentRecord.new(kind: 'h1', content: content)
        end
      end
      
      # Crawl h2 tags
      h2_tags = dom.css('h2')
      h2_tags.each do |h2_tag|
        content = h2_tag.text.to_s
        if content && content.strip.length > 0
          self.content_records << ContentRecord.new(kind: 'h2', content: content)
        end
      end
      
      # Crawl h3 tags
      h3_tags = dom.css('h3')
      h3_tags.each do |h3_tag|
        content = h3_tag.text.to_s
        if content && content.strip.length > 0
          self.content_records << ContentRecord.new(kind: 'h3', content: content)
        end
      end
      
      # Crawl a tags
      a_tags = dom.css('a')
      a_tags.each do |a_tag|
        content = a_tag['href'].to_s
        if content && content.strip.length > 0
          self.content_records << ContentRecord.new(kind: 'a', content: content)
        end
      end
    end
end
