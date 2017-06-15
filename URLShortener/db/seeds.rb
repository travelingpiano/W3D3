# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
ShortenedUrl.destroy_all
Visit.destroy_all
Tagging.destroy_all
TagTopic.destroy_all

user1 = User.create!(email:"smarter@gmail.com", premium:1)
user2 = User.create!(email:"smart@gmail.com", premium:0)
user3 = User.create!(email:"smartest@gmail.com", premium:0)
user4 = User.create!(email:"smarterer@gmail.com", premium:0)
user5 = User.create!(email:"smarterest@gmail.com", premium:0)
user6 = User.create!(email:"smrater@gmail.com", premium:0)


short1 = ShortenedUrl.create!(long_url:"www.hello.com/asdfkjsldfjals", short_url: "www.aaaaaaaaa.com", user_id: user1.id)
short2 = ShortenedUrl.create!(long_url:"www.hello.com/asdfkjsldfj", user_id: user1.id)
short3 = ShortenedUrl.create!(long_url:"www.hellothere.com/asdfkjsldfjals", short_url: "www.bbbbbbbbbb.com", user_id: user1.id)
short4 = ShortenedUrl.create!(long_url:"www.hellohihi.com/asdfkjsldfjals", short_url: "www.cccccccccc.com", user_id: user1.id)
short5 = ShortenedUrl.create!(long_url:"www.hellokitty.com/asdfkjsldfjals", short_url: "www.ddddddddd.com", user_id: user1.id)
short6 = ShortenedUrl.create!(long_url:"www.helloaslkdjf.com/asdfkjsldfjals", short_url: "www.eeeeeeeee.com", user_id: user1.id)
short7 = ShortenedUrl.create!(long_url:"www.hellonuiranisndvka.com/asdfkjsldfjals", short_url: "www.fffffffff.com", user_id: user1.id)


visit1 = Visit.create!(url_id: short1.id, user_id: user1.id)
visit2 = Visit.create!(url_id: short3.id, user_id: user1.id)
visit3 = Visit.create!(url_id: short4.id, user_id: user1.id)
visit4 = Visit.create!(url_id: short5.id, user_id: user1.id)
visit5 = Visit.create!(url_id: short6.id, user_id: user1.id)
visit6 = Visit.create!(url_id: short6.id, user_id: user1.id)


tag1 = TagTopic.create!(topic:"cats")
tagging1 = Tagging.create!(tag_id: tag1.id, url_id: short1.id)
tagging2 = Tagging.create!(tag_id: tag1.id, url_id: short3.id)
tagging3 = Tagging.create!(tag_id: tag1.id, url_id: short4.id)
tagging4 = Tagging.create!(tag_id: tag1.id, url_id: short5.id)
tagging5 = Tagging.create!(tag_id: tag1.id, url_id: short6.id)
tagging6 = Tagging.create!(tag_id: tag1.id, url_id: short7.id)
