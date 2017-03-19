# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

# config/schedule.rb

# 出力先のログファイルの指定
set :output, 'log/crontab.log'
# ジョブの実行環境の指定
rails_env = ENV['RAILS_ENV'] || 'development'
set :environment, rails_env


# 一時間毎のスケジューリング
every :hour do # Many shortcuts available: :hour, :day, :month, :year, :reboot
  rake 'update_gigazine_feed:exec'
  rake 'update_cnet_feed:exec'
  rake 'update_appgiga_feed:exec'
  rake 'update_itmedia_feed:exec'
  rake 'update_itmatome_feed:exec'
  rake 'update_engadget_feed:exec'
  rake 'update_buildinsider_feed:exec'
  rake 'update_codezine_feed:exec'
  rake 'update_getnews_feed:exec'
  rake 'update_nelog_feed:exec'
  rake 'update_techcrunch_feed:exec'
end
