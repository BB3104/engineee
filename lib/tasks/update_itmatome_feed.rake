require 'feedjira'
namespace :update_itmatome_feed do
  task exec: :environment do
    #RSSを取得する
    url_lists = ['http://blog.livedoor.jp/itsoku/index.rdf']
    url_lists.each do |url|
      feed = Feedjira::Feed.fetch_and_parse(url)

      feed.entries.each do |entry|
        # local_entry = feed.entries.where(title: item.title).first_or_initialize
        rss_itmatome = RssItmatome.find_or_initialize_by(url: entry.url)
        # item.save(:title => entry.title, content: entry.content, author: entry.author, url: entry.url, published: entry.published)

        # parsed_html = Nokogiri::HTML.fragment(entry.summary, 'utf-8')
        # 画像のファイル名を取得
        image_url = ""
        # images = parsed_html.css('img')
        # if images.present?
        #   images.each do |image|
        #     image_url = image.attributes["src"].value
        #   end
        # end
        # parsed_html = Nokogiri::HTML.fragment(entry.content, 'utf-8')
        # # 画像のファイル名を取得
        # image_url = ""
        # images = parsed_html.css('img')
        # if images.present?
        #   images.each do |image|
        #     image_url = image.attributes["src"].value
        #   end
        # end
        # p entry
        # p entry.title
        # p entry.content
        # p entry.author
        # p entry.url
        # p entry.published
        # p entry.summary
        # p entry.image
        rss_itmatome.media_title = feed.title
        rss_itmatome.title = entry.title
        rss_itmatome.guid = entry.entry_id
        rss_itmatome.url = entry.url
        rss_itmatome.description = entry.summary
        rss_itmatome.image = image_url

        rss_itmatome.author = entry.author
        rss_itmatome.content = entry.content
        rss_itmatome.content_published_at = entry.published
        rss_itmatome.content_updated_at = entry.updated
        rss_itmatome.save
      end
    end
  end
end
