class IndexController < ApplicationController
  def index
    @limit_cnt = 20
    @limit_cnt_arrival = 40

    cache_expire = 15.minutes
    # binding.pry
    @rss_appgigas = Rails.cache.fetch('appgiga', expires_in: cache_expire) do
      RssAppgiga.order_newest.limit(@limit_cnt)
    end
    @rss_gigazines = Rails.cache.fetch('gigazine', expires_in: cache_expire) do
      RssGigazine.order_newest.limit(@limit_cnt)
    end
    @rss_itmedias = Rails.cache.fetch('itmedia', expires_in: cache_expire) do
      RssItmedia.order_newest.limit(@limit_cnt)
    end
    @rss_itmatmarkits = Rails.cache.fetch('itmatmarkit', expires_in: cache_expire) do
      RssItmatmarkit.order_newest.limit(@limit_cnt)
    end
    @rss_cnets = Rails.cache.fetch('cnet', expires_in: cache_expire) do
      RssCnet.order_newest.limit(@limit_cnt)
    end
    @rss_engadgets = Rails.cache.fetch('engadget', expires_in: cache_expire) do
      RssEngadget.order_newest.limit(@limit_cnt)
    end
    @rss_techcrunchs = Rails.cache.fetch('techcrunch', expires_in: cache_expire) do
      RssTechcrunch.order_newest.limit(@limit_cnt)
    end
    @rss_getnews = Rails.cache.fetch('getnews', expires_in: cache_expire) do
      RssGetnews.order_newest.limit(@limit_cnt)
    end
    @rss_codezines = Rails.cache.fetch('codezine', expires_in: cache_expire) do
      RssCodezine.order_newest.limit(@limit_cnt)
    end
    # @rss_nelogs = Rails.cache.fetch('nelog', expires_in: cache_expire) do
    #   RssNelog.order_newest.limit(@limit_cnt)
    # end
    @rss_gizmodos = Rails.cache.fetch('gizmodo', expires_in: cache_expire) do
      RssGizmodo.order_newest.limit(@limit_cnt)
    end
    @rss_buildinsiders = Rails.cache.fetch('buildinsider', expires_in: cache_expire) do
      RssBuildinsider.order_newest.limit(@limit_cnt)
    end
    @rss_itmatomes = Rails.cache.fetch('itmatome', expires_in: cache_expire) do
      RssItmatome.order_newest.limit(@limit_cnt)
    end

    @new_arrivals = @rss_itmedias + @rss_itmatmarkits + @rss_cnets + @rss_engadgets + @rss_techcrunchs + @rss_getnews + @rss_appgigas + @rss_codezines + @rss_gizmodos + @rss_buildinsiders + @rss_itmatomes
    @new_arrivals.sort! do |a, b|
      b[:content_published_at] <=> a[:content_published_at]
    end
  end
end
