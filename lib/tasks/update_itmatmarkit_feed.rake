require 'feedjira'
namespace :update_itmatmarkit_feed do
  task exec: :environment do
    #RSSを取得する
    url = 'http://rss.rssad.jp/rss/itmatmarkit/rss.xml'

    feed = Feedjira::Feed.fetch_and_parse(url)

    feed.entries.each do |entry|
      # local_entry = feed.entries.where(title: item.title).first_or_initialize
      rss_itmedia = RssItmatmarkit.find_or_initialize_by(url: entry.url)
      # item.save(:title => entry.title, content: entry.content, author: entry.author, url: entry.url, published: entry.published)

      # p entry
      # p entry.title
      # p entry.content
      # p entry.author
      # p entry.url
      # p entry.published
      # p entry.summary
      # p entry.image
      rss_itmedia.media_title = feed.title
      rss_itmedia.title = entry.title
      rss_itmedia.guid = entry.entry_id
      rss_itmedia.url = entry.url
      rss_itmedia.description = entry.summary
      rss_itmedia.image = ''

      rss_itmedia.author = entry.author
      rss_itmedia.content = entry.content
      rss_itmedia.content_published_at = entry.published
      rss_itmedia.content_updated_at = entry.updated
      rss_itmedia.save
    end
  end
end
