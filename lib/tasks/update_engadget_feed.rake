require 'feedjira'
namespace :update_engadget_feed do
  task exec: :environment do
    #RSSを取得する
    url = 'http://japanese.engadget.com/rss.xml'
    feed = Feedjira::Feed.fetch_and_parse(url)

    feed.entries.each do |entry|
      # local_entry = feed.entries.where(title: item.title).first_or_initialize
      rss_engadget = RssEngadget.find_or_initialize_by(url: entry.url)
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
      rss_engadget.media_title = feed.title
      rss_engadget.title = entry.title
      rss_engadget.guid = entry.entry_id
      rss_engadget.url = entry.url
      rss_engadget.description = entry.summary
      rss_engadget.image = image_url
      rss_engadget.author = entry.author
      rss_engadget.content = entry.content
      rss_engadget.content_published_at = entry.published
      rss_engadget.save
    end
  end
end