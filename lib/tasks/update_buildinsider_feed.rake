require 'feedjira'
namespace :update_buildinsider_feed do
  task exec: :environment do
    #RSSを取得する
    url = 'http://www.buildinsider.net/rss'

    feed = Feedjira::Feed.fetch_and_parse(url)

    feed.entries.each do |entry|
      # local_entry = feed.entries.where(title: item.title).first_or_initialize
      rss_buildinsider = RssBuildinsider.find_or_initialize_by(url: entry.url)
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
      rss_buildinsider.media_title = feed.title
      rss_buildinsider.title = entry.title
      rss_buildinsider.guid = entry.entry_id
      rss_buildinsider.url = entry.url
      rss_buildinsider.description = entry.summary
      rss_buildinsider.image = image_url

      rss_buildinsider.author = entry.author
      rss_buildinsider.content = entry.content
      rss_buildinsider.content_published_at = entry.published
      rss_buildinsider.content_updated_at = entry.updated
      rss_buildinsider.save
    end
  end
end