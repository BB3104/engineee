# frozen_string_literal: true

class RssType < ApplicationRecord
  has_many :rss_articles

  class << self
    def site_names
      RssType.all.pluck(:site_name)
    end

    def rss_urls_list
      hash = {}
      RssType.site_names.each do |site_name|
        case site_name
        when 'gigazine'
          hash.store(site_name, 'https://gigazine.net/news/rss_2.0/')
        when 'itmedia'
          hash.store(site_name, 'https://rss.itmedia.co.jp/rss/2.0/news_bursts.xml')
        when 'itmatmarkit'
          hash.store(site_name, 'https://rss.rssad.jp/rss/itmatmarkit/rss.xml')
        when 'engadget'
          hash.store(site_name, 'https://japanese.engadget.com/rss.xml')
        when 'techcrunch'
          hash.store(site_name, 'https://jp.techcrunch.com/tag/rss/')
        when 'getnew'
          hash.store(site_name, 'https://getnews.jp/feed/ext/orig')
        when 'codezine'
          hash.store(site_name, 'https://codezine.jp/rss/new/20/index.xml')
        when 'gizmodo'
          hash.store(site_name, 'https://feeds.gizmodo.jp/rss/gizmodo/index.xml')
        when 'buildinsider'
          hash.store(site_name, 'https://www.buildinsider.net/rss')
        when 'itmatome'
          hash.store(site_name, 'https://blog.livedoor.jp/itsoku/index.rdf')
        when 'cnet'
          hash.store(site_name, 'http://feeds.japan.cnet.com/rss/cnet/all.rdf')
        end
      end
      hash
    end
  end
end
