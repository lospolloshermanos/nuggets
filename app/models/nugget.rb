class Nugget < ActiveRecord::Base
  include ActionView::Helpers::SanitizeHelper

  belongs_to :user
  has_many :entries
  attr_accessor :feed, :posts

  validates :rss, presence: true, uniqueness: true

  before_create :set_defaults

  def fetch
    self.feed = Feedjira::Feed.fetch_and_parse rss
    self.posts = feed.entries
  end

  private

  def set_defaults
    fetch
    doc = Pismo::Document.new feed.url
    self.favicon = doc.favicon
    self.name = feed.title
    posts.each do |post|
      self.entries.build({ 
        title: post.title, 
        summary: "#{strip_tags(post.summary[0..60])} …",
        content: post.content || post.summary,
        author: post.author,
        url: post.url,
        published_at: post.published
      })
    end
  end
end
