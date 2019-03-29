# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'hogehoge@gmail.com', password: 'fugafuga', password_confirmation: 'fugafuga')

RSS_ARTICLES_SITES = %w[gigazine
                        itmedia
                        engadget
                        techcrunch
                        getnew
                        codezine
                        gizmodo
                        buildinsider
                        itmatome
                        cnet]

RSS_ARTICLES_SITES.each do |site_name|
  RssType.create!(site_name: site_name)
end
