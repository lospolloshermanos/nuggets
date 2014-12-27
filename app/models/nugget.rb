class Nugget < ActiveRecord::Base
  belongs_to :user
  
  attr_accessor :feed, :entries

  validates :rss, presence: true, uniqueness: true

  before_create :set_defaults
  
  def fetch
    self.feed = Feedjira::Feed.fetch_and_parse rss
    self.entries = feed.entries
  end

  private

  def set_defaults
    fetch
    doc = Pismo::Document.new feed.url
    self.favicon = doc.favicon
    self.name = feed.title
  end
end
