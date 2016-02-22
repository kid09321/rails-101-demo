# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
create_account = User.create([email: 'example@gmail.com',password: '12345678',password_confirmation: '12345678',name: '測試用帳號'])
puts "這個測試檔會自動建立一個測試帳號,然後創20個groups,每個group有30個posts"
create_groups = for i in 1..20 do
                 	Group.create([title: "Group no.#{i}",description: "這是第#{i}個group", user_id: "1"])
                 	for k in 1..30 do
                    Post.create([content: "這是種子建立的第#{k}個post",group_id: "#{i}",user_id: "1"])
                end
            end
