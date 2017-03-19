require 'feedjira'
namespace :update_getnews_feed do
  task exec: :environment do
    #RSSを取得する
    url = 'http://getnews.jp/feed/ext/orig'

    feed = Feedjira::Feed.fetch_and_parse(url)

    feed.entries.each do |entry|
      # local_entry = feed.entries.where(title: item.title).first_or_initialize
      rss_getnews = RssGetnews.find_or_initialize_by(url: entry.url)
      # item.save(:title => entry.title, content: entry.content, author: entry.author, url: entry.url, published: entry.published)

            parsed_html = Nokogiri::HTML.fragment(entry.summary, 'utf-8')
            # 画像のファイル名を取得
            image_url = ""
            images = parsed_html.css('img')
            if images.present?
              images.each do |image|
                image_url = image.attributes["src"].value
              end
            end
      # p entry
      # p entry.title
      # p entry.content
      # p entry.author
      # p entry.url
      # p entry.published
      # p entry.summary
      # p entry.image
      rss_getnews.media_title = feed.title
      rss_getnews.title = entry.title
      rss_getnews.guid = entry.entry_id
      rss_getnews.url = entry.url
      rss_getnews.description = entry.summary
      rss_getnews.image = image_url

      rss_getnews.author = entry.author
      rss_getnews.content = entry.content
      rss_getnews.content_published_at = entry.published
      rss_getnews.content_updated_at = entry.updated
      rss_getnews.save
    end
  end
end