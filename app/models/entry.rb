class Entry < ActiveRecord::Base
  belongs_to :nugget

  def self.get_entry(nugget, url)
    if entry = nugget.entries.find_by(url: url)
      { title: entry.title, author: entry.author, content: entry.content, published: entry.published_at }
    else
      entries = Feedjira::Feed.fetch_and_parse(nugget.rss).entries
      
      if entry = entries.select { |entry| entry.url == url }.first
        { title: entry.title, author: entry.author, content: entry.content || entry.summary, published: entry.published }
      end
    end
  end
end
