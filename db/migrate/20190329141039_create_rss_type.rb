class CreateRssType < ActiveRecord::Migration[5.2]
  def change
    create_table :rss_types do |t|
      t.string :site_name
      t.timestamps

      t.index :site_name, unique: true
    end
  end
end
