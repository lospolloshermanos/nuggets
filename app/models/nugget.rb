class Nugget < ActiveRecord::Base
  include ActionView::Helpers::SanitizeHelper

  belongs_to :user
  has_many :entries
  attr_accessor :feed, :fresh_entries

  validates :rss, presence: true, uniqueness: true

  before_create :set_defaults

  def fetch
    self.feed = Feedjira::Feed.fetch_and_parse rss
    self.fresh_entries = feed.entries
  end

  private

  def set_defaults
    fetch
    doc = Pismo::Document.new feed.url
    self.favicon = doc.favicon
    self.name = feed.title
  end
end
