# frozen_string_literal: true

class IndexController < ApplicationController
  def index
    @limit_cnt = 20
    @limit_cnt_arrival = 40
    @new_arrivals = []

    RssType.site_names.each do |site|
      eval("@rss_#{site}s = RssType.find_by(site_name: site).rss_articles.order_newest.limit(@limit_cnt)")
      @new_arrivals += eval("@rss#{site}s") if eval("@rss#{site}s").present?
    end

    @new_arrivals.sort! do |a, b|
      b[:content_published_at] <=> a[:content_published_at]
    end
  end
end
