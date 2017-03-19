require 'feedjira'
namespace :update_gigazine_feed do
  task exec: :environment do
    #RSSを取得する
    # url = 'http://rss.rssad.jp/rss/ascii/rss.xml'
    # url = 'http://feeds.gizmodo.jp/rss/gizmodo/index.xml'
    url = 'http://feed.rssad.jp/rss/gigazine/rss_2.0'
    # url = 'http://rss.rssad.jp/rss/itmatmarkit/fwcr/rss.xml'
    feed = Feedjira::Feed.fetch_and_parse(url)

    feed.entries.each do |entry|
      # local_entry = feed.entries.where(title: item.title).first_or_initialize
      rss_gigazine = RssGigazine.find_or_initialize_by(url: entry.url)
            parsed_html = Nokogiri::HTML.fragment(entry.summary, 'utf-8')
            # 画像のファイル名を取得
            image_url = ""
            images = parsed_html.css('img')
            if images.present?
              images.each do |image|
                image_url = image.attributes["src"].value
              end
            end
      # i
      # p entry
      # p entry.title
      # p entry.content
      # p entry.author
      # p entry.url
      # p entry.published
      # p entry.summary
      # p entry.image
rss_gigazine.media_title = feed.title
      rss_gigazine.title = entry.title
      rss_gigazine.guid = entry.entry_id
      rss_gigazine.url = entry.url
      rss_gigazine.description = entry.summary
            rss_gigazine.image = image_url
      rss_gigazine.author = entry.author
      rss_gigazine.content = entry.content
      rss_gigazine.content_published_at = entry.published
      rss_gigazine.content_updated_at = entry.updated
      rss_gigazine.save
    end
  end
end