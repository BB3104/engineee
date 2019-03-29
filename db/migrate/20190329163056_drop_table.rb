class DropTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :rss_appgigas
    drop_table :rss_buildinsiders
    drop_table :rss_cnets
    drop_table :rss_codezines
    drop_table :rss_engadgets
    drop_table :rss_getnews
    drop_table :rss_gigazines
    drop_table :rss_gizmodos
    drop_table :rss_itmatmarkits
    drop_table :rss_itmatomes
    drop_table :rss_itmedia
    drop_table :rss_nelogs
    drop_table :rss_techcrunches
  end
end
