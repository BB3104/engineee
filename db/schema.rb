# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170319073743) do

  create_table "rss_appgigas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "media_title"
    t.string   "title"
    t.text     "content",              limit: 65535
    t.text     "description",          limit: 65535
    t.string   "image"
    t.text     "url",                  limit: 65535
    t.string   "author"
    t.string   "guid"
    t.datetime "content_published_at"
    t.datetime "content_updated_at"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "rss_buildinsiders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "media_title"
    t.string   "title"
    t.text     "content",              limit: 65535
    t.text     "description",          limit: 65535
    t.string   "image"
    t.text     "url",                  limit: 65535
    t.string   "author"
    t.string   "guid"
    t.datetime "content_published_at"
    t.datetime "content_updated_at"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "rss_cnets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "media_title"
    t.string   "title"
    t.text     "content",              limit: 65535
    t.text     "description",          limit: 65535
    t.string   "image"
    t.text     "url",                  limit: 65535
    t.string   "author"
    t.string   "guid"
    t.datetime "content_published_at"
    t.datetime "content_updated_at"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "rss_codezines", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "media_title"
    t.string   "title"
    t.text     "content",              limit: 65535
    t.text     "description",          limit: 65535
    t.string   "image"
    t.text     "url",                  limit: 65535
    t.string   "author"
    t.string   "guid"
    t.datetime "content_published_at"
    t.datetime "content_updated_at"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "rss_engadgets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "media_title"
    t.string   "title"
    t.text     "content",              limit: 65535
    t.text     "description",          limit: 65535
    t.string   "image"
    t.text     "url",                  limit: 65535
    t.string   "author"
    t.string   "guid"
    t.datetime "content_published_at"
    t.datetime "content_updated_at"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "rss_getnews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "media_title"
    t.string   "title"
    t.text     "content",              limit: 65535
    t.text     "description",          limit: 65535
    t.string   "image"
    t.text     "url",                  limit: 65535
    t.string   "author"
    t.string   "guid"
    t.datetime "content_published_at"
    t.datetime "content_updated_at"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "rss_gigazines", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "media_title"
    t.string   "title"
    t.text     "content",              limit: 65535
    t.text     "description",          limit: 65535
    t.string   "image"
    t.text     "url",                  limit: 65535
    t.string   "author"
    t.string   "guid"
    t.datetime "content_published_at"
    t.datetime "content_updated_at"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "rss_itmatomes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "media_title"
    t.string   "title"
    t.text     "content",              limit: 65535
    t.text     "description",          limit: 65535
    t.string   "image"
    t.text     "url",                  limit: 65535
    t.string   "author"
    t.string   "guid"
    t.datetime "content_published_at"
    t.datetime "content_updated_at"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "rss_itmedia", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "media_title"
    t.string   "title"
    t.text     "content",              limit: 65535
    t.text     "description",          limit: 65535
    t.string   "image"
    t.text     "url",                  limit: 65535
    t.string   "author"
    t.string   "guid"
    t.datetime "content_published_at"
    t.datetime "content_updated_at"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "rss_nelogs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "media_title"
    t.string   "title"
    t.text     "content",              limit: 65535
    t.text     "description",          limit: 65535
    t.string   "image"
    t.text     "url",                  limit: 65535
    t.string   "author"
    t.string   "guid"
    t.datetime "content_published_at"
    t.datetime "content_updated_at"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "rss_techcrunches", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "media_title"
    t.string   "title"
    t.text     "content",              limit: 65535
    t.text     "description",          limit: 65535
    t.string   "image"
    t.text     "url",                  limit: 65535
    t.string   "author"
    t.string   "guid"
    t.datetime "content_published_at"
    t.datetime "content_updated_at"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

end
