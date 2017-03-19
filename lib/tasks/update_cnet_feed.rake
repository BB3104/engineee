require 'feedjira'
namespace :update_cnet_feed do
  task exec: :environment do
    #RSSを取得する
    url = 'http://feeds.japan.cnet.com/rss/cnet/all.rdf'
    feed = Feedjira::Feed.fetch_and_parse(url)
# p feed.title
    feed.entries.each do |entry|
      # local_entry = feed.entries.where(title: item.title).first_or_initialize
      rss_cnet = RssCnet.find_or_initialize_by(url: entry.url)
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
      # p image_url
      # p entry
      # p entry.title
      # p entry.content
      # p entry.author
      # p entry.url
      # p entry.published
      # p entry.summary
      # p entry.image
      # p entry.image
      rss_cnet.media_title = feed.title
      rss_cnet.title = entry.title
      rss_cnet.guid = entry.entry_id
      rss_cnet.url = entry.url
      rss_cnet.description = entry.summary
      rss_cnet.author = entry.author
      rss_cnet.content = entry.content
      rss_cnet.image = image_url
      rss_cnet.content_published_at = entry.published
      rss_cnet.content_updated_at = entry.updated
      rss_cnet.save
    end
  end
end