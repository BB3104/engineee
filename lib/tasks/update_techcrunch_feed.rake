require 'feedjira'
namespace :update_techcrunch_feed do
  task exec: :environment do
    #RSSを取得する
    url = 'http://jp.techcrunch.com/feed/'

    feed = Feedjira::Feed.fetch_and_parse(url)

    feed.entries.each do |entry|
      # local_entry = feed.entries.where(title: item.title).first_or_initialize
      rss_techcrunch = RssTechcrunch.find_or_initialize_by(url: entry.url)
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
      rss_techcrunch.media_title = feed.title
      rss_techcrunch.title = entry.title
      rss_techcrunch.guid = entry.entry_id
      rss_techcrunch.url = entry.url
      rss_techcrunch.description = entry.summary
      rss_techcrunch.image = image_url

      rss_techcrunch.author = entry.author
      rss_techcrunch.content = entry.content
      rss_techcrunch.content_published_at = entry.published
      rss_techcrunch.content_updated_at = entry.updated
      rss_techcrunch.save
    end
  end
end