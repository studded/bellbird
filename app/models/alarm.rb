class Alarm < ApplicationRecord

  # SHOULD USE delayed_job OR SIMILAR, AND BETTER GEM FOR WEB REQUESTS
  
  require "uri"
  require "net/http"
  
  PUSH_URL = 'https://bellbird.joinhandshake-internal.com/push'
  
  after_create :post_notification
  
  def message=(val)
    self[:message] = val.upcase
  end
  
  def post_notification
    uri = URI.parse PUSH_URL
    params = {
      'alarm_id': self[:id]
    }
    resp = Net::HTTP.post_form uri, params
    puts "~~~~~~~~~~~~~~~~RESPONSE:~~~~~~~~~~~~~~~~~"
    puts resp.body
    puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  end
  
end
