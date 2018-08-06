class Alarm < ApplicationRecord

  # SHOULD USE delayed_job OR SIMILAR, AND BETTER GEM FOR WEB REQUESTS
  require "uri"
  require "net/http"
  
  PUSH_URL = 'https://bellbird.joinhandshake-internal.com/push'
  
  has_many :upvotes
  
  validate :message_is_upcase
  
  after_create :post_notification
  
  #def message=(val)
  #  self[:message] = val.upcase
  #end
  def message_is_upcase
    errors.add(:message,'must be uppercase!') unless message == message.upcase
  end
  
  def post_notification
    uri = URI.parse PUSH_URL
    params = {
      'alarm_id': self[:id]
    }
    resp = Net::HTTP.post_form uri, params
  end
  
  def score
    upvotes.where(positive:true).count - upvotes.where(positive:false).count
  end
  
end