require 'feedjira'
namespace :update_codezine_feed do
  task exec: :environment do
    #RSSを取得する
    url = 'http://rss.rssad.jp/rss/codezine/new/20/index.xml'

    feed = Feedjira::Feed.fetch_and_parse(url)

    feed.entries.each do |entry|
      # local_entry = feed.entries.where(title: item.title).first_or_initialize
      rss_codezine = RssCodezine.find_or_initialize_by(url: entry.url)
      # item.save(:title => entry.title, content: entry.content, author: entry.author, url: entry.url, published: entry.published)


      # p entry
      # p entry.title
      # p entry.content
      # p entry.author
      # p entry.url
      # p entry.published
      # p entry.summary
      # p entry.image
      rss_codezine.media_title = feed.title
      rss_codezine.title = entry.title
      rss_codezine.guid = entry.entry_id
      rss_codezine.url = entry.url
      rss_codezine.description = entry.summary
      rss_codezine.image = ''

      rss_codezine.author = entry.author
      rss_codezine.content = entry.content
      rss_codezine.content_published_at = entry.published
      rss_codezine.content_updated_at = entry.updated
      rss_codezine.save
    end
  end
end