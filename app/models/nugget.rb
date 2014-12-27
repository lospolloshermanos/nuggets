class Nugget < ActiveRecord::Base
  belongs_to :user
  
  attr_accessor :feed, :entries

  validates :rss, presence: true

  before_create :set_name
  
  def fetch
  	self.feed = Feedjira::Feed.fetch_and_parse rss
  	self.entries = feed.entries
  end

  private

  def set_name
  	fetch 
  	self.name ||= feed.title
  end
end
