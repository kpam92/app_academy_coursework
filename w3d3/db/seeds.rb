# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([ name: 'Chicago' ,  name: 'Copenhagen' ])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create([email: 'kevin@kevin.com'])
User.create([email: 'kn@kevin.com'])
User.create([email: 'kvin@kevin.com'])
User.create([email: 'kevn@kevin.com'])
User.create([email: 'kev@kevin.com'])
User.create([email: 'in@kevin.com'])
User.create([email: 'evin@kevin.com'])
User.create([email: 'vin@kevin.com'])
User.create([email: 'ke@kevin.com'])
User.create([email: 'kein@kevin.com'])
User.create([email: 'kevin@ken.com'])
User.create([email: 'kevin@ke.com'])
User.create([email: 'kei@ken.com'])
User.create([email: 'kevi@kevi.com'])
User.create([email: 'vin@kn.com'])

ShortenedUrl.create([short_url: 'www.short.om', long_url: 'loooooooooongurlomg', user_id: 1])
ShortenedUrl.create([short_url: 'www.short.m', long_url: 'loooooooooongurlomg', user_id: 2])
ShortenedUrl.create([short_url: 'www.short.om', long_url: 'loooooooooonlomg', user_id: 3])
ShortenedUrl.create([short_url: 'www.sht.com', long_url: 'looooooongurlomg', user_id: 1])
ShortenedUrl.create([short_url: 'www.sh.com', long_url: 'ldasfdasoongurlomg', user_id: 5])
ShortenedUrl.create([short_url: 'www.short.co', long_url: 'looooooodfsasdfasdoongfurlomg', user_id: 5])
ShortenedUrl.create([short_url: 'www.shot.co', long_url: 'loooooooooongurlasdasdfomfg', user_id: 5])
ShortenedUrl.create([short_url: 'www.sho.com', long_url: 'loooooooooongurloddddddddmg', user_id: 6])


Visit.create(shortened_url_id: 2, user_id: 3)
Visit.create(shortened_url_id: 2, user_id: 3)
Visit.create(shortened_url_id: 2, user_id: 4)
Visit.create(shortened_url_id: 2, user_id: 2)
Visit.create(shortened_url_id: 2, user_id: 3)
Visit.create(shortened_url_id: 2, user_id: 6)
Visit.create(shortened_url_id: 2, user_id: 7)
Visit.create(shortened_url_id: 2, user_id: 1)
Visit.create(shortened_url_id: 2, user_id: 9)
Visit.create(shortened_url_id: 3, user_id: 9)
Visit.create(shortened_url_id: 3, user_id: 7)
Visit.create(shortened_url_id: 1, user_id: 9)
