class CreateRssGigazines < ActiveRecord::Migration[5.0]
  def change
    create_table :rss_gigazines do |t|
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
    # add_index :rss_gigazines, :content_published_at,
  end
end
