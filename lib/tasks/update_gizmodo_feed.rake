require 'feedjira'
namespace :update_gizmodo_feed do
  task exec: :environment do
    # RSSを取得する
    url = 'http://feeds.gizmodo.jp/rss/gizmodo/index.xml'

    feed = Feedjira::Feed.fetch_and_parse(url)

    feed.entries.each do |entry|
      rss_gizmodo = RssGizmodo.find_or_initialize_by(url: entry.url)

      # parsed_html = Nokogiri::HTML.fragment(entry.summary, 'utf-8')
      # 画像のファイル名を取得
      image_url = ''
      # images = parsed_html.css('img')
      # if images.present?
      #   images.each do |image|
      #     image_url = image.attributes['src'].value
      #   end
      # end
      rss_gizmodo.media_title = feed.title
      rss_gizmodo.title = entry.title
      rss_gizmodo.guid = entry.entry_id
      rss_gizmodo.url = entry.url
      rss_gizmodo.description = entry.summary
      rss_gizmodo.image = image_url

      rss_gizmodo.author = entry.author
      rss_gizmodo.content = entry.content
      rss_gizmodo.content_published_at = entry.published
      rss_gizmodo.content_updated_at = entry.updated
      rss_gizmodo.save
    end
  end
end
