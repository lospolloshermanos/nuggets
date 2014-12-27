class Nugget < ActiveRecord::Base
  
  belongs_to :user
  
  attr_accessor :feeds, :entries

  def fetch
  	self.feeds = Feedjira::Feed.fetch_and_parse rss
  	self.entries = feeds.entries
  end
end
