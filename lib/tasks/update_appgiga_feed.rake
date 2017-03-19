require 'feedjira'
namespace :update_appgiga_feed do
  task exec: :environment do
    #RSSを取得する
    url = 'http://plus.appgiga.jp/feed/user'

    feed = Feedjira::Feed.fetch_and_parse(url)

    feed.entries.each do |entry|
      # local_entry = feed.entries.where(title: item.title).first_or_initialize
      rss_appgiga = RssAppgiga.find_or_initialize_by(url: entry.url)
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
      rss_appgiga.media_title = feed.title
      rss_appgiga.title = entry.title
      rss_appgiga.guid = entry.entry_id
      rss_appgiga.url = entry.url
      rss_appgiga.description = entry.summary
      rss_appgiga.image = image_url

      rss_appgiga.author = entry.author
      rss_appgiga.content = entry.content
      rss_appgiga.content_published_at = entry.published
      rss_appgiga.content_updated_at = entry.updated
      rss_appgiga.save
    end
  end
end