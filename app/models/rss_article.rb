# frozen_string_literal: true

class RssArticle < ApplicationRecord
  belongs_to :rss_type

  scope :order_newest, -> { order('content_published_at desc, id desc') }
end
