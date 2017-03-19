class RssItmatome < ApplicationRecord
  scope :order_newest, -> { order('content_published_at DESC, id DESC') }
end
