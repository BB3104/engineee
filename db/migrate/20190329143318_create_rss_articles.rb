class CreateRssArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :rss_articles do |t|
      t.references :rss_type, foreign_key: true
      t.string :media_title
      t.string :title
      t.text :content
      t.text :description
      t.string :image
      t.text :url
      t.string :author
      t.string :guid
      t.datetime :content_published_at
      t.datetime :content_updated_at
      t.timestamps
    end
  end
end
