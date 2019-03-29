require 'feedjira'
namespace :update_rss_feed do
  task exec: :environment do
    #RSSを取得する
    RssType.rss_urls_list.each do |site_name, url|
      begin
        feed = Feedjira::Feed.fetch_and_parse(url)
      rescue StandardError => e
        puts "url: #{url}"
        puts e
      end
      feed.entries.each do |entry|
        # local_entry = feed.entries.where(title: item.title).first_or_initialize
        rss_type = RssType.find_by!(site_name: site_name)
        rss = rss_type.rss_articles.find_or_initialize_by(url: entry.url)
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
        rss.media_title = feed.title
        rss.title = entry.title
        rss.guid = entry.entry_id
        rss.url = entry.url
        rss.description = entry.summary
        rss.image = image_url

        rss.author = entry.author
        rss.content = entry.content
        rss.content_published_at = entry.published
        rss.content_updated_at = entry.updated
        binding.pry
        rss.save!
      end
    end
  end
end
